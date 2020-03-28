class Product < ApplicationRecord
  enum sales_status: {"出品中":0,"公開停止":1,"取引中":2,"売却済み":3}

  belongs_to :category
end
