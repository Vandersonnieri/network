class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # validates uniqueness: true
end
