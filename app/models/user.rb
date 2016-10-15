class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def transactions
    plaid_user = Plaid::User.load(:connect, self.plaid_id)
    transactions = plaid_user.transactions(start_date: Date.today.at_beginning_of_month, end_date: Date.today)
  end

  def update_bucket
    self.transactions.each do |transaction|
      unless self.rounded_transactions.include?(transaction.id)
        rounded_amount = transaction.amount.ceil - transaction.amount
        self.bucket += rounded_amount
        self.rounded_transactions << transaction.id
      end
    end
    self.save
  end

  def empty_bucket(end_of_month = true)
    total = self.bucket.dup
    self.bucket = 0
    self.rounded_transactions = [] if end_of_month
    self.save
  end
end
