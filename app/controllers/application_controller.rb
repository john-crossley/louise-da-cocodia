class ApplicationController < ActionController::Base
  # Protects from cross-site-request forgery
  protect_from_forgery

  # Make these methods available as helper methods.
  helper_method [:page_title, :current_user, :logged_in?, :is_current]

  protected

    # page_title
    # This allows us to have a dynamic page title.
    def page_title
      (@content_for_title + " - " if @content_for_title).to_s + " Louise Da-Cocodia "
    end

  	def login(user)
  		session[:user_id] = user.id
  	end

  	def current_user
  		# If the user_id session id is found return the user.
      current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

  	def logged_in?
  		# Do we have a user?
  		!current_user.nil?
  	end

end
