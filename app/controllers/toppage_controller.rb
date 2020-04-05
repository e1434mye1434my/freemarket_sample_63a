class ToppageController < ApplicationController
  def index
    @products = Product.all
  end
end