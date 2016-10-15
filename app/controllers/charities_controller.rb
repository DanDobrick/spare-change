require 'json'
require 'net/http'
require 'uri'

class CharitiesController < ApplicationController

  def index
    if params[:search]
     p category = params[:search]
      url = "data.orghunter.com/v1/charitysearch?user_key=#{ENV['CHARITY_TOKEN']}&searchTerm=#{category}"
      p url
      encoded_url = URI.encode(url)
      uri = URI.parse(encoded_url)
      response = HTTParty.get('http://'"#{encoded_url}")
      @charities = response['data']
    end
  end

end
