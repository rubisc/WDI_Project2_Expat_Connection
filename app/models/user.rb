class User < ApplicationRecord
  has_many :posts
  # has_many :comments
  validates :name,  presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 50 },
            uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 7 }
end
