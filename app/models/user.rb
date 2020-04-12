class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  has_many :products
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product
  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end
end
