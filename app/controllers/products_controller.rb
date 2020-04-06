class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]
  before_action :set_category, only: [:new, :create, :edit, :update]

  def index
    
  end

  def new
    @product = Product.new
    @product.images.build
    @url = request.url
  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find_by(id: params[:child_id]).children
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      @product.update(sales_status: 0)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_child_array = @product.category.parent.siblings

    @category_grandchild_array = @product.category.siblings
  
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
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
    params.require(:product).permit(:name, :price, :stock, :condition_id, :size, :brand, :category_id, :introduction, :sales_status, :burden_id, :method, :prefecture_id, :estimated_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @category = Category.where(ancestry: nil)
  end
end