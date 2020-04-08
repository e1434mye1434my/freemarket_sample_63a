require 'rails_helper'

describe Card do
  describe '#create' do 
    it "customer_idがないと登録できないこと" do
      card = Card.new(user_id: "1", customer_id: "",card_id: "car_c472a9858bb1f2c887f5c36cfd3f" )
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end
  end
end