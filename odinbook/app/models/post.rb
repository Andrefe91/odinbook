class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :likes, through: :interactions

  validates :title, :body, presence: true
end
