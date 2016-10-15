desc "This task is called by the Heroku scheduler add-on"
task :process_donations => :environment do
  all_users = User.where('bucket >= ?', [5])
  binding.pry
  new_donations = all_users.map do |user|
    user.update_bucket
    Donation.new(user_id: user.id, current_charity_ein: user.current_charity_ein, user_bucket: user.empty_bucket)
  end
  pending_donations = Donation.find(pending: true)
  pending_donations += new_donations
  pending_donations.each do |donation|
    if donation.user.account_balance >= donation.amount
      donation.process
      donation.pending = false
    else
      donation.pending = true
    end
  end
end
