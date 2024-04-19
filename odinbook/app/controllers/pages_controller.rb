class PagesController < ApplicationController

  def home

  end

  #Method for returning to the posts index page after successful login
  def after_sign_in_path_for(*)
    posts_path
  end

end
