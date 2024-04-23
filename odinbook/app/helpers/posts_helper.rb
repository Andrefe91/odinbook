module PostsHelper
  def user_likes
    # This is memoization, the @user_likes_list only gets calculated on the first call, and subsequent calls
    # return the same list of values.
    @user_likes_list ||= current_user.likes.ids
  end
  
end
