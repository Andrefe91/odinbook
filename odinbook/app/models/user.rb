class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :interactions, dependent: :destroy
  has_many :likes, through: :interactions, source: :post, dependent: :destroy

  # More information here: https://dev.to/lberge17/building-a-follower-relationship-in-rails-108n
  has_many :relations, dependent: :destroy

  # Allows association to view list of users who follow a given user i.e. user.followers
    # This association is meant to fetch all "Relation" instances where the 'User' is the one being followed.
  has_many :follower_relation, foreign_key: :following_id, class_name: 'Relation'
    # This association collects all the users who follow this user
  has_many :followers, through: :follower_relation, source: :follower

  # Allows association to view list of users who follow a given user i.e. user.following
    # This association is meant to fetch all "Relation" instances where the 'User' is the one who follows.
  has_many :following_relation, foreign_key: :follower_id, class_name: 'Relation'
    # This association collects all the users that this user follows
  has_many :following, through: :following_relation, source: :following

  has_one_attached :avatar

  def follow(user)
    following_relation.create(following_id: user.id)
  end

  def unfollow(user)
    following_relation.find_by(following_id: user.id).destroy
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
