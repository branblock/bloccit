class SessionsController < ApplicationController
  def new
  end

# search datatbase for user with specified email address
  def create
    user = User.find_by(email: params[:session][:email].downcase)

#verify that user is not nil and that password in the params hash matches the specified password
    if user && user.authenticate(params[:session][:password])
      create_session user
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password combination'
      render :new
    end
  end

#define destroy method, which will delete a user's session
  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
