class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  # does this row below have to be in my controller instead?
  # validates :body, presence: true, length: { maximum: 300 }
end
