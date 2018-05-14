class PostsController < ApplicationController
  def index
    params[:tag] ? @posts = Post.tagged_with(params[:tag]) : @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      redirect_to @post 
    else 
      render :new
    end 
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end
end
