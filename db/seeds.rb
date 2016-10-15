# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dan = User.create!(email: 'dandobrick@gmail.com', password: 'password', first_name: 'Dan', last_name: 'Dobrick', plaid_id: ENV['DAN_PLAID_ID'], stripe_account: ENV['DAN_STRIPE_ID'], account_id: ENV['DAN_ACCOUNT_ID'])
# User.create!(email: 'test1', password: 'password', first_name: 'Dan', last_name: 'Dobrick', plaid_id: ENV['DAN_PLAID_ID'], stripe_account: ENV['DAN_STRIPE_ID'], account_id: ENV['DAN_ACCOUNT_ID'])
10.times{ Donation.create!(user_id: dan.id, current_charity_ein: '133682664', user_bucket: rand(1..15))}
