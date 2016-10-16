class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    this_month_donations = Donation.where('updated_at > ?', Date.today.at_beginning_of_month)
    top_five_array =  Donation.group(:current_charity_ein).sum(:user_bucket).first(5)
    eins = top_five_hash.map{|ein_sum_pair| ein_sum_pair[0]}
    @top_five = []
    top_five_array.each do |top|
      url = "data.orghunter.com/v1/charitysearch?user_key=#{ENV['CHARITY_TOKEN']}&ein=#{top[0]}"
      encoded_url = URI.encode(url)
      uri = URI.parse(encoded_url)
      response = HTTParty.get('http://'"#{encoded_url}")
      charity_name = response['data'][0]['charityName']
      @top_five.push(charity_name)
    end
    render '/index'
  end


end
