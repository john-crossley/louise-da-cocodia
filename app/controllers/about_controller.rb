class AboutController < ApplicationController

	def index
    @posts = Post.all
    @content_for_title = "About"
	end

  def donate
    @posts = Post.all
    @content_for_title = "Donate"
  end

  def objectives
    @posts = Post.all
    @content_for_title = "Objectives"
  end

  def volunteering
    @posts = Post.all
    @content_for_title = "Volunteering"
  end

  def history
    @content_for_title  = "History"
  end

end
