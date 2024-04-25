class RelationsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  def index
    #Collect all the users in the database. Because there arent that many,
    #we can present them all in one request and in the same place.
    @users = User.all
  end

  def create
    #The Follow method it's defined in the 'User' model and uses the
    #following_relation association to create a record.
    if current_user.follow(@user)
      redirect_to user_relations_path(current_user), notice: "User followed"
    else
      redirect_to user_relations_path(current_user), notice: "User not followed"
    end
  end

  def destroy
    #The Unfollow method it's defined in the 'User' model and uses the
    #following_relation association to delete the record.
    if current_user.unfollow(@user)
      redirect_to user_relations_path(current_user), notice: "User unfollowed"
    else
      redirect_to user_relations_path(current_user), notice: "User not unfollowed"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
