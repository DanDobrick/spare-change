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
    end
    describe "When plaid id is set" do
      it 'has a set of transcactions' do
        billy = User.new(email: 'billy_bob@orgin.org', password: 'password', first_name: 'billy', last_name: 'bob', plaid_id: ENV['DAN_PLAID_ID'], stripe_account: ENV['DAN_STRIPE_ID'], account_id: ENV['DAN_ACCOUNT_ID'])
        expect(billy.transactions).to_not be([])
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
