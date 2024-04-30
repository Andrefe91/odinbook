class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_rich_text :body

  has_many :interactions, dependent: :destroy
  has_many :likes, through: :interactions, source: :user, dependent: :destroy

  validates :title, presence: true
end
