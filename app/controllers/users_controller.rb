class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user = User.create!(user_params)
      session[:user_id] = user.id
      redirect_to "/categories"
    else
      redirect_to "/users/new"
    end
  end

  def show
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
