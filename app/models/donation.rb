class Donation < ActiveRecord::Base
  belongs_to :user

  def process
    # If user balance is above the amount of the donation, then charge them
    # then send that money somewhere
  end

end