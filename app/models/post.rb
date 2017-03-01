class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  # do these rows below have to be in my controller instead?
  # validates :title, presence: true,
  # validates :city, presence: true
  # validates :body, presence: true, length: { maximum: 500 }
end
