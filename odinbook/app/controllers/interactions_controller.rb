class InteractionsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    current_user.likes << @post
  end

  def destroy
    current_user.likes.delete(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
