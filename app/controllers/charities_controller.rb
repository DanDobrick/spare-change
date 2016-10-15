require 'json'
require 'net/http'
require 'uri'

class CharitiesController < ApplicationController

  def index

  end

  def search
    p "hi"
    if params[:search]
     p category = params[:search]
      url = "http://data.orghunter.com/v1/charitysearch?user_key=#{CHARITY_TOKEN}&searchTerm=#{category}"
      uri = URI(url)
      p "helooooo"
      p response = Net::HTTP.get(uri)
      @charities = JSON.parse(response)

    end


    #@charities =  params[:keyword]).first
    # if hashtag
    #   render json: hashtag.tweets.ordered_json
    # else
    #   render :nothing => true, status: 404
    # end
  end

end
