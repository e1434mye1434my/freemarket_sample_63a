class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :text, presence: true, profanity_filter: true
end
