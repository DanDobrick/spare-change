class Donation < ActiveRecord::Base
  belongs_to :user

  def process
    payment_hash = {amount: (self.user_bucket * 100).to_i, currency: 'usd', customer: self.user.stripe_account }
    binding.pry
    Stripe::Charge.create(payment_hash)
  end

end