class UsersController < ApplicationController

  def new
    session[:user_id] = nil if logged_in?
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

    ein = @user.current_charity_ein
      url = "data.orghunter.com/v1/charitysearch?user_key=#{ENV['CHARITY_TOKEN']}&ein=#{ein}"
      encoded_url = URI.encode(url)
      response = HTTParty.get('http://'"#{encoded_url}")
      @charity = response['data'][0]

    if logged_in? && @user.id == session[:user_id]
      @user.update_bucket
      @user.save
      if request.xhr?
        render json: @user
      else
        render :show
      end
    else
      redirect_to new_session_path
    end
  end

  def edit
    if logged_in?
      @user = User.find_by(id: current_user.try(:id))
    else
      redirect_to new_session_path
    end
  end

  def update
    @user = User.find_by(id: current_user.try(:id))
    @user.update_attributes(user_params)
    @user.cap_donation

    render :edit
  end

  # this is a custom update just to update the charity. so in future if we are updating user information, it can be completely separate from the update method.
  def charity_update
    @user = User.find_by(id: current_user.try(:id))
    @user.current_charity_ein = params[:charity_ein]
    @user.current_charity_name = params[:charity_name].titleize
    @user.save

    redirect_to user_path(@user)
  end


  def charity_pause
    @user = User.find_by(id: current_user.try(:id))
    @user.stop_donation

    redirect_to user_path(@user)
  end

  def donation_history
    if logged_in? && params[:id].to_i == current_user.id
      user = User.find_by(id: params[:id].to_i)
      if user
        @donations = user.donations.where(:pending => false).order(updated_at: :desc)
        render :history
      else
        redirect_to root_path
      end
    else
      redirect_to new_session_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :email, :first_name, :last_name, :max_donation)
  end


end
