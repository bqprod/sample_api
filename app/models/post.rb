class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :likes
  has_many :comments

  validates :title, :body, presence: true
end
