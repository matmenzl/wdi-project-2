class PostsController < ApplicationController
  before_filter :require_permission, only: :edit

  def require_permission
    if current_user != Post.find(params[:id]).user 
      flash[:warning] = "Naughty you! You cannot edit posts of other users."
      redirect_to root_path
    end
  end

  def index
    @q = User.search(params[:q])
    @posts = @q.result(distinct: true)
    @post = Post.all
    @users = User.all
    @posts = Post.near([current_user.latitude, current_user.longitude], 0.5)
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
        flash[:success] = "Your post has been listed!"
        redirect_to @post
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
      redirect_to current_user
    else 
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Your post has been deleted!"
      redirect_to root_path
    else
      render @post
      flash[:warning] = "Your post has not been deleted!"
  end
end

  private
    def post_params
        params.require(:post).permit(:title, :post_type, :image, :price, :remote_image_url, :longitude, :latitude, :distance)
    end
end

