class ProfilesController < ApplicationController
  before_action :set_user
  def show

  end

  private

  def set_user
    @user = User.find_by(email: "#{params[:username]}@gmail.com")
  end
end
