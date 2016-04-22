class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
        flash[:success] = "Your service has been listed!"
        redirect_to posts_path
    else
        render "new"
    end
  end

  def edit
    if current_user.id == @post.user.id
    @post = Post.find(params[:id])
  else 
    render "signup"
  end
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
          params.require(:post).permit(:title, :post_type, :image, :price, :remote_image_url)
      end
end
