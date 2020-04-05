class Product < ApplicationRecord
  belongs_to  :category
  belongs_to  :user
  has_many    :images, dependent: :destroy
  has_one     :shipping
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :shipping, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  enum sales_status: {"出品中":0,"公開停止":1,"取引中":2,"売却済み":3}

  validates :images, presence: true, length: { maximum: 10}
  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 1, maximum: 40}
  validates :introduction, presence: true, length: { minimum: 1, maximum: 1000}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "入力してください"}
  validates :condition, presence: true
  validates :burden, presence: true
  # validates :method, presence: true
  validates :estimated, presence: true
  validates :prefecture_id, presence: true
end
