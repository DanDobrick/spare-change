class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ["Invalid username or password"]
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end
