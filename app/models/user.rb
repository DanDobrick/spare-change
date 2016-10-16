class User < ActiveRecord::Base
  has_secure_password
  has_many :donations

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def transactions
    if self.plaid_id
      plaid_user = Plaid::User.load(:connect, self.plaid_id)
      all_transactions = plaid_user.transactions(start_date: Date.today.at_beginning_of_month, end_date: Date.today)
      transactions = all_transactions.map{|transaction| transaction if self.account_id == transaction.account_id}
      return transactions.compact
    else
      return []
    end
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def update_bucket
    self.transactions.each do |transaction|
      unless self.rounded_transactions.include?(transaction.id)
        if transaction.amount > 0
          rounded_amount = transaction.amount.ceil - transaction.amount
          self.bucket += rounded_amount
          self.rounded_transactions << transaction.id
        end
      end
    end
    self.save
  end

  def empty_bucket(end_of_month = true)
    total = self.bucket.dup
    self.bucket = 0
    self.rounded_transactions = [] if end_of_month
    self.save
    return total
  end

  def account_balance
    if self.plaid_id
      plaid_user = Plaid::User.load(:connect, self.plaid_id)
      accounts = plaid_user.balance
      accounts.each do |account|
        return account.current_balance if account.id == self.account_id
      end
    end
  end

  def stop_donation
    ein = self.current_charity_ein
    unprocessed_donations = self.donations.where(current_charity_ein: ein, pending: true)
    unprocessed_donations.destroy_all
    self.plaid_id = nil
    self.current_charity_ein = nil
    self.current_charity_name = nil
    self.bucket = 0.0
    self.save
  end
end
