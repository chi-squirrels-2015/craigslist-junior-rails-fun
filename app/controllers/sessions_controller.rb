class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to "/categories"
    else
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to "/"
  end

end
