module UsersHelper

  def user_has_no_posts(user)
    user = @user
    @user.posts.count < 1
  end

  def user_has_no_comments(user)
    user = @user
    @user.comments.count < 1
  end
end
