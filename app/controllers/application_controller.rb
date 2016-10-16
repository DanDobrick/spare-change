class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    this_month_donations = Donation.where('updated_at > ?', Date.today.at_beginning_of_month)
    donation_sum_array =  Donation.group(:current_charity_ein).sum(:user_bucket)
    top_five_array = donation_sum_array.sort_by{|array| array[1]}.reverse[0..4]

    @top_five = top_five_array.map do |ein, amount|
      charity_name = get_charity_name(ein)
      {name: charity_name, amount: amount}
    end
    render '/index'
  end

  private

  def get_charity_name(ein)
    url = "data.orghunter.com/v1/charitysearch?user_key=#{ENV['CHARITY_TOKEN']}&ein=#{ein}"
    encoded_url = URI.encode(url)
    uri = URI.parse(encoded_url)
    response = HTTParty.get("http://#{encoded_url}")
    response['data'][0]['charityName']
  end


end
