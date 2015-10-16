class UsersController < ApplicationController

  def new
    @user = User.new
  end

  #create a new user with new and then set the corresponding attributes from the params hash
  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

  #save the new user to the database; if the database save is successful, add a flash message, and if not, display an error message and render the new view
    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      redirect_to root_path
    else
      flash[:error] = "There was an error creating your account. Please try again."
      render :new
    end
  end

end
