class MypagesController < ApplicationController
  def index
  end

  def show
    @sold_products = Product.where(sales_status: 3, user_id: current_user.id)
  end

  def likes
  end

  def exhibiting
    @exhibiting_products = Product.where(sales_status: 0, user_id: current_user.id)
  end

  def in_progress
  end

  def completed
    @completed_products = Product.where(sales_status: 3, user_id: current_user.id)
  end

  def logout
  end
end
