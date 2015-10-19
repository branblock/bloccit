module SessionsHelper

# define methods which are unique for each user
  def create_session(user)
    session[:user_id] = user.id
  end

# clear the id on the session object by setting it to nil
  def destroy_session(user)
    session[:user_id] = nil
  end

# #6
  def current_user
    User.find_by(id: session[:user_id])
  end
end
