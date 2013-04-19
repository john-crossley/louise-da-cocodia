class ContactController < ApplicationController
	def new
    @content_for_title = "Contact"
	end

	def dispatch_email
		flash[:notice] = "Application is currently in Demo"
		redirect_to contact_path
	end

	def create

	end
end
