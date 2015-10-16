require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #create hash of attributes to use in specs
  let (:new_user_attributes) do
    {
      name: "Blochead",
      email: "blochead@bloc.io",
      password: "blochead",
      password_confirmation: "blochead"
    }
  end

  #test the new action for http success when issuing a GET
  describe "GET new" do
    it "returns http success" do
      get :new
    expect(response).to have_http_status(:success)
    end

    it "instantiates a new user" do
      get :new
    expect(:user).to_not be_nil
    end
  end

  describe "POST create" do
  #test the create action for http success
    it "returns http success" do
      post :create, user: new_user_attributes
      expect(response).to have_http_status(:redirect)
  end

  #test that the database count on the users table increases by one when a POST is issued to create
    it "creates a new user" do
      expect{
        post :create, user: new_user_attributes
      }.to change(User, :count).by(1)
    end

    #test that user.name is set properly when a user is created
    it "sets user name properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).name).to eq new_user_attributes[:name]
    end

    #test that user.email is set properly when a user is created
    it "sets user email properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).email).to eq new_user_attributes[:email]
    end

    #test that user.password is set properly when a user is created
    it "sets user password properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).password).to eq new_user_attributes[:password]
    end

    #test that user.password_confirmation is set properly when a user is created
    it "sets user password_confirmation properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
    end
  end
end
