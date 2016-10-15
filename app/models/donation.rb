class Donation < ActiveRecord::Base

  def process
    # If user balance is above the amount of the donation, then charge them
    # then send that money somewhere
  end

end