class AboutController < ApplicationController

	def index
    @posts = Post.all
	end

  def donate
    @posts = Post.all
  end

  def objectives
    @posts = Post.all
  end

  def volunteering
    @posts = Post.all
  end

  def history
  end

end
