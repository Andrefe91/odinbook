class ProfilesController < ApplicationController
  before_action :set_user
  def show
    @user_posts = @user.posts
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
