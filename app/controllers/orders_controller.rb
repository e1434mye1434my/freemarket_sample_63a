class OrdersController < ApplicationController

  require 'payjp'

  def new
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "cards", action: "new"
      flash[:alert] = "購入にはクレジットカードの登録が必要です"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
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

  def pay
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if @product.sales_status == "出品中"
      Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
      Payjp::Charge.create(
        amount: @product.price,
        customer: card.customer_id,
        currency: 'jpy'
      )
      @product.update(sales_status: 3, buyer_id: current_user.id)
    else
      raise
    end
    redirect_to action: 'done'
    rescue => e
      redirect_to  product_path(@product.id), alert: '商品の購入に失敗しました'
  end

  def done
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "orders" && path[:action] == "new"
      @product = Product.find(params[:id])
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
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
      else
        redirect_to root_path
      end
  end
end
