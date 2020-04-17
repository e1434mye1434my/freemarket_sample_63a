class CommentsController < ApplicationController
  before_action :set_product

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to product_path(@product)
    else 
      redirect_to product_path(@comment.product.id),alert: 'コメントの投稿に失敗しました'
    end
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
