class PostsController < ApplicationController
  before_filter :require_permission, only: :edit

  def require_permission
    if current_user != Post.find(params[:id]).user 
      flash[:warning] = "Naughty you! You cannot edit posts of other users."
      redirect_to root_path
    end
  end

  def index
    #restrict view to post index to users with street current user has signed up with
    #connect user_id from posts table with street and User of user-table
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.longitude = current_user.longitude
    @post.latitude = current_user.latitude
    if @post.save
        flash[:success] = "Your service has been listed!"
        redirect_to posts_path
    else
        render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else 
      render 'edit'
    end
  end

  def destroy
  end

  private
    def post_params
        params.require(:post).permit(:title, :post_type, :image, :price, :remote_image_url, :longitude, :latitude, :distance)
    end
end
