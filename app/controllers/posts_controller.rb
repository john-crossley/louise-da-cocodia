class PostsController < ApplicationController

	# Protect the create action
	before_filter :authenticate, only: [:create]

  def single_post
    @post = Post.find(params[:id])
    @content_for_title = "#{@post.title}"
  end

  def index
  	@content_for_title = "Blog"
    @post = Post.new

    # Grab all public posts.
    # @posts = Post.public_posts(params);
    # @posts = Post.where(public: false)
    @posts = Post.order('created_at DESC')
  end

  def new
    @post = Post.new
    @content_for_title = "Add a new post"
  end

  def create
  	@post = current_user.posts.build(params[:post])
  	if @post.save
  		flash[:success] = "Your post has been submitted."
  		redirect_to blog_path
  	else
  		@posts = Post.public_posts(params)
  		render 'index'
  	end
  end
end
