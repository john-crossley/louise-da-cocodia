class PostsController < ApplicationController

	# Protect the create action
	before_filter :authenticate, only: [:create, :edit, :update]

  # def single_post
  #   @post = Post.find(params[:id])
  #   @content_for_title = "#{@post.title}"
  # end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Your blog article has been deleted."
      redirect_to blog_path
    else

    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Your question has been updated."
      redirect_to @post
    else
      render 'new'
    end
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
  		redirect_to @post
  	else
  		@posts = Post.public_posts(params)
  		render 'new'
  	end
  end
end
