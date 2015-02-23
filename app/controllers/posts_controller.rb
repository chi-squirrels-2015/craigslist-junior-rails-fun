class PostsController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    # post.category_id = params[:category_id]
    # post.user = current_user
    post.save
    redirect_to "/categories/#{params[:category_id]}"

  end

  def show
    @post = Post.find(params[:id])
    @category = @post.category
  end

  def edit
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to "/categories/#{params[:category_id]}"
  end

  private
  def post_params
    params.require(:post).permit(:title, :body).merge({category_id: params[:category_id], user: current_user})
  end
end
