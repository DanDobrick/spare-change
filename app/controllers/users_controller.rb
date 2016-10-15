class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end


  def show
    @user = User.find_by(id: current_user.try(:id))

    if !logged_in? || @user.id != session[:user_id]
      # render "../../public/404", layout: false
      redirect_to new_session_path
    else
      @user.update_bucket
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :email, :first_name, :last_name)
  end


end
