class CardsController < ApplicationController

  require 'payjp'

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
    @card = Card.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.create(
        card: params[:payjp_token],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
        flash[:notice] = "追加しました。"
      else
        redirect_to action: "create"
      end
    
  end

  def destroy
    card = Card.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to action: "show"
  end

  def show
    @card = Card.where(user_id: current_user.id).first
    if @card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end

  private

  def card_params
    params.permit('payjp-token')
  end
end
