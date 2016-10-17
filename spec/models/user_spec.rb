require 'rails_helper'

describe User do

  describe "attributes" do
  let(:user) { User.create!(first_name: "Joe", last_name: "Smith", email: "joe@yahoo.com", password: "password") }

    it "has a first_name" do
      expect(user.first_name).to eq("Joe")
    end

    it "has a last_name" do
      expect(user.last_name).to eq("Smith")
    end

    it "has an email" do
      expect(user.email).to eq("joe@yahoo.com")
    end

    it "has a hashed password" do
      expect(user.password_digest).to_not be user.password
    end

    it "has a bucket default value" do
      expect(user.bucket).to eq(0.0)
    end
  end

  describe "Methods" do
    describe 'When there is no plaid_id yet' do
      it 'has an empty set of transactions' do
        no_plaid = User.new(email: 'test@test.org', password: 'password', first_name: 'Dan', last_name: 'Park')
        expect(no_plaid.transactions).to eq([])
      end
      it 'User#update_bucket doesn\'t change the bucket amount' do
        no_plaid = User.new(email: 'test@test.org', password: 'password', first_name: 'Dan', last_name: 'Park')
        expect{no_plaid.update_bucket}.to_not change(no_plaid, :bucket).from(0)
      end
    end

    describe "When plaid id is set" do
      before do
        Timecop.freeze(Time.local(2016, 10, 16))
      end
      it 'has a set of transcactions' do
        billy = User.new(email: 'billy_bob@orgin.org', password: 'password', first_name: 'billy', last_name: 'bob', plaid_id: ENV['DAN_PLAID_ID'], stripe_account: ENV['DAN_STRIPE_ID'], account_id: ENV['DAN_ACCOUNT_ID'], created_at: Date.new(2016,10,1))
        expect(billy.transactions).to_not be([])
      end
      it 'User#update_bucket updates the bucket amount' do
        billy = User.new(email: 'billy_bob@orgin.org', password: 'password', first_name: 'billy', last_name: 'bob', plaid_id: ENV['DAN_PLAID_ID'], stripe_account: ENV['DAN_STRIPE_ID'], account_id: ENV['DAN_ACCOUNT_ID'], created_at: Date.new(2016,10,1))
        expect{billy.update_bucket}.to change(billy, :bucket)
      end
    end

    describe 'User#empty_bucket(end_of_month)' do
      describe 'when end_of_month is true or not passed in' do
        it 'it empties bucket and resets transactions' do
          billy = User.new(email: 'billy_bob@orgin.org', password: 'password', first_name: 'billy', last_name: 'bob', plaid_id: ENV['DAN_PLAID_ID'], stripe_account: ENV['DAN_STRIPE_ID'], account_id: ENV['DAN_ACCOUNT_ID'], created_at: Date.new(2016,10,1))

          billy.update_bucket
          expect(billy.bucket).to_not eq(0)
          billy.empty_bucket
          expect(billy.bucket).to eq(0)
          expect(billy.rounded_transactions).to eq([])
        end
      end

      describe 'when end_of_month is false' do
        it 'it empties bucket and DOES NOT reset transactions' do
          billy = User.new(email: 'billy_bob@orgin.org', password: 'password', first_name: 'billy', last_name: 'bob', plaid_id: ENV['DAN_PLAID_ID'], stripe_account: ENV['DAN_STRIPE_ID'], account_id: ENV['DAN_ACCOUNT_ID'], created_at: Date.new(2016,10,1))

          billy.update_bucket
          expect(billy.bucket).to_not eq(0)
          billy.empty_bucket(false)
          expect(billy.bucket).to eq(0)
          expect(billy.rounded_transactions).to_not eq([])
        end
      end
    end

    describe 'User#cap_donation' do
      describe 'when user bucket is   greater than max_donation' do
        it 'it resets user bucket with    user max_donation' do
            cy = User.new(email: 'cy@orgin.org', password: 'password', first_name: 'cy', last_name: 'bob')

            cy.bucket = 20.00
            cy.max_donation = 5.00
            cy.cap_donation
            expect(cy.bucket).to eq(5.00)
          end
        end
      end
    end
  end

  describe "validations" do
    it "is invalid without a first_name" do
      user = User.new(last_name: "Smith", email: "joe@yahoo.com", password: "password")
      expect(user.valid?).to eq false
    end

   it "is invalid without a last_name" do
      user = User.new(first_name: "Joe", email: "joe@yahoo.com", password: "password")
      expect(user.valid?).to eq false
    end

    it "is invalid without an email" do
      user = User.new(first_name: "Joe", last_name: "Smith",password: "password")
      expect(user.valid?).to eq false
    end

    it "requires emails to be unique" do
      user = User.create(first_name: "Joe", last_name: "Smith", email: "Joe@yahoo.com", password: "password")
      user = User.create(first_name: "Joe", last_name: "Smith", email: "Joe@yahoo.com", password: "password")
      expect(user.valid?).to eq false
    end
  end

end
