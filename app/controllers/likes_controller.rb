class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(product_id: params[:product_id])
    redirect_to product_path(@like.product.id)
  end

  def destroy
    @like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
    @like.destroy
    redirect_to product_path(@like.product.id)
  end
end
