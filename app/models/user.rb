class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  has_many :products
  has_many :comments
  has_one  :shipping
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end
  
  validates :name, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。' } 
  validates :last_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。' } 
  validates :birthday, presence: true
  validates :post_number, presence: true, format: { with: /\A\d{3}[-]\d{4}\z|\A\d{3}[-]\d{2}\z|\A\d{3}\z|\A\d{5}\z|\A\d{7}\z/ }
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :house_number, presence: true
end
