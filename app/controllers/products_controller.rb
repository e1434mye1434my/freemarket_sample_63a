class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]
  before_action :set_category, only: [:new, :create, :edit, :update]

  def index
    
  end

  def new
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
    if @product.save(sales_status: 0)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    if @product.destroy
      redirect_to mypages_path
      flash[:notice] = "商品を削除しました"
    else
      redirect_to product_path(params[:id])
    end
  end
  
  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :condition_id, :size, :brand, :category_id, :introduction, :sales_status, :burden_id, :method, :prefecture_id, :estimated_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @category = Category.where(ancestry: nil)
  end
end