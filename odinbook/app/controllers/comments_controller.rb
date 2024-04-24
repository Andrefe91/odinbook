class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(valid_comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created'
    else
      redirect_to post_path(@post), notice: "Error in creating comment"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post), notice: "Comment Deleted"
  end

  private

  def valid_comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
