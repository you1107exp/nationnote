class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

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

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    if post.valid?
      post.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :country_id, :content, :ref_url, :ref_img).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
