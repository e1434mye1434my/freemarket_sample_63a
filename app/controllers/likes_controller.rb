class LikesController < ApplicationController
  def create
    like = current_user.likes.build(product_id: params[:product_id])
    if like.save
      redirect_to product_path(like.product.id)
      flash[:notice] = 'いいねしました'
    else
      flash[:notice] = 'いいねできませんでした'
    end
  end

  def destroy
    like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
    if like.destroy
      redirect_to product_path(like.product.id)
      flash[:notice] = 'いいね削除しました'
    else
      flash[:notice] = 'いいね削除できませんでした'
    end
  end
end
