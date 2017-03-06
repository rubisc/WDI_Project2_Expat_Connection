class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true
  validates :city, presence: true
  validates :body, presence: true, length: { maximum: 500 }
  validates :date, presence: true
end
