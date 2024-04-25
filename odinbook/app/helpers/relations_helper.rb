module RelationsHelper
  def followed_users
    # This is memoization, the @user_likes_list only gets calculated on the first call, and subsequent calls
    # return the same list of values.
    @followed_users ||= current_user.following.map { |user| user.id}
  end
end
