class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  has_many :products
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end
  
  validates :name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_furigana, presence: true
  validates :last_furigana, presence: true
  validates :birthday, presence: true
  validates :post_number, presence: true
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :house_number, presence: true
end
