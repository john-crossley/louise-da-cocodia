class ContactController < ApplicationController
	def new
	end

	def dispatch_email

		flash[:notice] = "Sent!"
		redirect_to contact_path
	end

	def create

	end
end