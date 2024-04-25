class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    # Added an ordering so the first post in the index are always the most recent
    @posts = Post.all.includes(:user).order(created_at: :desc)

    # This check is done because of the followed_users method, which requires a logged user
    if user_signed_in?
      #Idea from here: https://chat.openai.com/share/a93ee5f6-2efc-4e4d-9ae3-87a24193cc60
      @followed_users_posts = @posts.select {|post| followed_users.include?(post.user_id)}
    end
  end

  def show
  end

  def new
    @post = Post.new()
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path, notice: "Post was successfully destroyed"
  end

  # Redirect to the stored location after the user signs in:
  def after_sign_in_path_for(*)
    posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    # When you pass comments: :user to the includes method, you are instructing Rails to not only preload the comments
    # associated with the Post but also to preload the User associated with each of those comments. This is a nested
    # includes, which is useful when you have a chain of objects connected through associations and you need to access
    # properties from the extended chain.

    @post = Post.includes(comments: :user).find(params[:id])
    # @post = Post.includes(:comments).find(params[:id])
  end

  def followed_users
    # This is memoization, the @user_likes_list only gets calculated on the first call, and subsequent calls
    # return the same list of values.
    @followed_users ||= current_user.following.map { |user| user.id} << current_user.id
  end

end
