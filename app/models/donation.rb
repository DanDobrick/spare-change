class Donation < ActiveRecord::Base
  belongs_to :user

  def process
    p 'whooooooooo hooooooo'
  end

end