class ProductsController < ApplicationController



  
  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to mypages_index_path, flash: { notice: "商品を削除しました"}
    else
      redirect_to product_path(params[:id])
    end
  end
  

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :condition, :size, :introduction, :sales_status)
  end
end