class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]
  def index
    
  end

  def new
    @category = Category.where(ancestry: nil)
    @product = Product.new
    @product.images.build
  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find_by(id: params[:child_id]).children
  end
  
  def create
    @product = Product.new(product_params)
    @category = Category.where(ancestry: nil)
    if @product.save
      @product.update(sales_status: 0)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category = Category.where(ancestry: nil)
  end

  def update
    @product.update(product_params)
    @category = Category.where(ancestry: nil)
  end
  
  def destroy
    if product.destroy
      redirect_to mypages_index_path, flash: { notice: "商品を削除しました"}
    else
      redirect_to product_path(params[:id])
    end
  end
  
  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :condition, :size, :category_id, :introduction, :sales_status, :burden, :method, :prefecture_id, :city, :estimated, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end