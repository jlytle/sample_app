class UsersController < ApplicationController
  
  def show
    @user  = User.find(params[:id])
    @title = @user.name
  end
    
  def new
    @user  = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      # Assigning "nil" and calling the "clear" method both do the same thing. I left both ways in for clarity.
      @user.password.clear
      @user.password_confirmation = nil
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params["id"])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
end
