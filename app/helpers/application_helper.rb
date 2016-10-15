module ApplicationHelper

  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def guidestar_ein(charity_ein)
    # ein_number = charity_ein.to_i
    charity_ein.insert(2, '-')
  end
end
