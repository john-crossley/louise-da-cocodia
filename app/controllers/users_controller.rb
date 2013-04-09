class UsersController < ApplicationController

  def new
  	# Create a new instance of the user
  	@user = User.new
  end

  def create
  	# Load the user object with our user data,
  	# this is taken from the user form once submitted.
  	@user = User.new(params[:user])

  	if @user.save
      # Send the user a welcome email.
      UserMailer.welcome_email(@user).deliver

  		# If saving the user was successful
  		flash[:success] = "Thanks for registering #{@user.save}!"
  		# Redirect the user once they have logged in.
  		redirect_to root_url
  	else
  		render 'new' # Display the form with errors.
  	end

  end

end