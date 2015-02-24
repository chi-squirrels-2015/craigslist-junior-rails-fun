class PostsController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html {redirect_to "/categories/#{params[:category_id]}"}
        format.js {render :xml => @post.to_xml}
      end
    end
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
