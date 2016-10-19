class Donation < ActiveRecord::Base
  belongs_to :user

  def process
    payment_hash = { amount: (self.user_bucket * 100).to_i,
                    currency: 'usd',
                    customer: self.user.stripe_account,
                    description: "Thank you for donating to #{self.user.current_charity_name}(EIN: #{self.current_charity_ein})!\n\nThis is a charitable donation made through Make My Donation a 501(c)(3) charitable organization operating a donor-advised fund, and is subject to all their Terms and Conditions. All donations are final and non-refundable.",
                    metadata:{
                      'Charity EIN' => self.user.current_charity_ein,
                      'Charity name' => self.user.current_charity_name,
                      'Donor first name' => self.user.first_name,
                      'Donor last name' => self.user.last_name,
                      'Donor email' => self.user.email,
                      'anonymous' => 'yes'
                             },
                    receipt_email: self.user.email
                   }
    Stripe::Charge.create(payment_hash)
  end

  def amount
    self.user_bucket
  end

end
