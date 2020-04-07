class Shipping < ApplicationRecord
  belongs_to :product, optional: true
end
