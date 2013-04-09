class SessionsController < ApplicationController

  def new
  end

  def create
  	# Find the user by their username
  	user = User.find_by_username(params[:session][:username])

  	if user && user.authenticate(params[:session][:password])
      login user
  		flash[:success] = "Success, you're now logged in!"
  		redirect_to root_url
  	else
  		flash.now[:error] = "Incorrect username and or password!"
      render 'new'
  	end

  end

  def destroy
    session[:user_id] = nil;
    redirect_to root_url, notice: 'You are now logged out. See ya!'
  end

end