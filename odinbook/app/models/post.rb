class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :interactions, dependent: :destroy
  has_many :likes, through: :interactions, source: :user, dependent: :destroy

  validates :title, :body, presence: true
end
