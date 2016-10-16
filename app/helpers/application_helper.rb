module ApplicationHelper

  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def guidestar_ein(charity_ein)
    charity_ein.insert(2, '-')
  end

  def get_charity_name(ein)
    url = "data.orghunter.com/v1/charitysearch?user_key=#{ENV['CHARITY_TOKEN']}&ein=#{ein}"
    encoded_url = URI.encode(url)
    uri = URI.parse(encoded_url)
    response = HTTParty.get("http://#{encoded_url}")
    response['data'][0]['charityName']
  end
end
