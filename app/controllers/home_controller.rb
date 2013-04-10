class HomeController < ApplicationController

  def index
  	@content_for_title = "Home"
  	# @posts = Post.where('created_at DESC')
  	@posts = Post.all
  end

end