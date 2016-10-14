class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #@user = User.new(password: params[:password], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
    if !logged_in? || @user.id != session[:user_id]
      render "../../public/404", layout: false
    else
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :email, :first_name, :last_name)
  end


end
