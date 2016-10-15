desc "This task is called by the Heroku scheduler add-on"

task :process_donations => :environment do
  if Date.today == Date.today.at_end_of_month
    User.all.each {|user| user.update_bucket}
    all_users = User.where('bucket >= ?', [5])
    new_donations = all_users.map do |user|
      binding.pry
      Donation.new(user_id: user.id, current_charity_ein: user.current_charity_ein, user_bucket: user.empty_bucket)
    end
    pending_donations = Donation.find_by(pending: true) || []
    pending_donations += new_donations
    pending_donations.each do |donation|
      if donation.user.account_balance >= donation.user_bucket
        binding.pry
        donation.process
        donation.pending = false
      else
        donation.pending = true
      end
      donation.save
    end
  end
end
