class CommentsController < ApplicationController
  before_action :set_product

  def create
    Comment.create(comment_params)
    redirect_to product_path(@product)
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def set_product
    @product = Product.includes(comments: :user).find(params[:product_id])
  end
end
