class User < ApplicationRecord
  has_many :posts, foreign_key: :creator_id
  has_many :likes
  has_many :comments

  validates :email, presence: true
end
