class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order("created_at DESC")
  end
  
  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    if post.valid? 
      post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :country_id, :content, :ref_url, :ref_img)
  end

end
