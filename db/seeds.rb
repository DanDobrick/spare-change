# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dan = User.create!(email: 'dandobrick@gmail.com', password: 'password', first_name: 'Dan', last_name: 'Dobrick', plaid_id: ENV['DAN_PLAID_ID'], stripe_account: ENV['DAN_STRIPE_ID'], account_id: ENV['DAN_ACCOUNT_ID'])
User.create!(email: 'test1@test1.org', password: 'password', first_name: 'test1', last_name: 'test11')
User.create!(email: 'test2@test2.org', password: 'password', first_name: 'test2', last_name: 'test22')
User.create!(email: 'test3@test3.org', password: 'password', first_name: 'test3', last_name: 'test33')
User.create!(email: 'test4@test4.org', password: 'password', first_name: 'test4', last_name: 'test44')
User.create!(email: 'test5@test5.org', password: 'password', first_name: 'test5', last_name: 'test55')
10.times{ Donation.create!(user_id: rand(1..5), current_charity_ein: '232532598', user_bucket: rand(1..15))}
5.times{ Donation.create!(user_id: rand(1..5), current_charity_ein: '610957586', user_bucket: rand(1..15))}
3.times{ Donation.create!(user_id: rand(1..5), current_charity_ein: '311627248', user_bucket: rand(1..15))}
2.times{ Donation.create!(user_id: rand(1..5), current_charity_ein: '262283742', user_bucket: rand(1..15))}
2.times{ Donation.create!(user_id: rand(1..5), current_charity_ein: '201841881', user_bucket: rand(1..15))}
2.times{ Donation.create!(user_id: rand(1..5), current_charity_ein: '271841913', user_bucket: rand(1..15))}
2.times{ Donation.create!(user_id: rand(1..5), current_charity_ein: '113821730', user_bucket: rand(1..15))}
2.times{ Donation.create!(user_id: rand(1..5), current_charity_ein: '223518379', user_bucket: rand(1..15))}
5.times{ Donation.create!(user_id: 2, current_charity_ein: '232532598', user_bucket: rand(1..15), pending: false, updated_at: Date.today.at_beginning_of_month)}
5.times{ Donation.create!(user_id: 2, current_charity_ein: '232532598', user_bucket: rand(1..15), pending: false, updated_at: Date.today)}