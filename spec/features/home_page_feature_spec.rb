require 'rails_helper'

feature 'display top 5 charities this month' do
  scenario 'there are donations this month' do
     Donation.create!(user_id: rand(1..5), current_charity_ein: '232532598', user_bucket: 99)
      Donation.create!(user_id: rand(1..5), current_charity_ein: '610957586', user_bucket: 4)
      big_dog = Donation.create!(user_id: rand(1..5), current_charity_ein: '311627248', user_bucket: 100)
      Donation.create!(user_id: rand(1..5), current_charity_ein: '262283742', user_bucket: 2)
      Donation.create!(user_id: rand(1..5), current_charity_ein: '201841881', user_bucket: 99.5)
      Donation.create!(user_id: rand(1..5), current_charity_ein: '271841913', user_bucket: 1)
      Donation.create!(user_id: rand(1..5), current_charity_ein: '113821730', user_bucket: 0)
      Donation.create!(user_id: rand(1..5), current_charity_ein: '223518379', user_bucket: 3)

    visit '/'

    expect(page).to have_content 'Big Dog Little Dog------$100'
    expect(page).to have_content 'North Texas Gay Lesbian Bisexual Transgender Chamber Of Cmmrc Inc------$99.5'
    expect(page).to have_content 'World Clown Association------$99'
    expect(page).to have_content 'Cat Haven Cat Club Of Louisville------$4'
    expect(page).to have_content 'Deal Endowment Fund Inc------$3'
    expect(page).to_not have_content 'A Dog The Arlington Dog Owners Group Inc, A Dog------$3'

  end
end
