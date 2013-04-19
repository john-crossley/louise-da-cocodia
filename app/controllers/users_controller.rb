class UsersController < ApplicationController

  #before_filter :authenticate, only: [:create, :edit, :update]

  def new
  	# Create a new instance of the user
  	@user = User.new
  end

  def edit
    @content_for_title = "Editing #{current_user.username}'s account"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Success, #{current_user.username}'s account has been updated."
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end

  def create
  	# Load the user object with our user data,
  	# this is taken from the user form once submitted.
  	@user = User.new(params[:user])

  	if @user.save
      # Send the user a welcome email.
      # UserMailer.welcome_email(@user).deliver

  		# If saving the user was successful
  		flash[:success] = "Thanks for registering #{@user.username}!"
  		# Redirect the user once they have logged in.
  		redirect_to root_url
  	else
  		render 'new' # Display the form with errors.
  	end

  end

end