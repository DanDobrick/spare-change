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

  def edit
    @user = User.find_by(id: current_user.try(:id))
  end

  def update
    @user = User.find_by(id: current_user.try(:id))
    @user.update_attributes(user_params)

    redirect_to user_path(@user)
  end

  # this is a custom update just to update the charity. so in future if we are updating user information, it can be completely separate from the update method.
  def charity_update
    @user = User.find_by(id: current_user.try(:id))
    @user.current_charity_ein = params[:id]
    @user.current_charity_name = params[:charity_name].titleize
    @user.save

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:password, :email, :first_name, :last_name)
  end


end
