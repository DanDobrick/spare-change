require 'rails_helper'

describe User do

  describe "attributes" do
  let(:user) { User.create!(first_name: "Joe", last_name: "Smith" email: "joe@yahoo.com", password: "password") }

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

  describe "validations" do
    it "is invalid without a username" do
      user = User.create(email: "joe@yahoo.com", password: "password")
      expect(user.valid?).to eq false
    end

    it "is invalid without an email" do
      user = User.create(username: "jack_noble", password: "password")
      expect(user.valid?).to eq false
    end

    it "requires a password of at least 8 characters" do
      user = User.create(username: "jack_noble", email: "jack@yahoo.com", password: "passwor")
      expect(user.valid?).to eq false
    end

    it "requires emails to be unique" do
      User.create(username: "ryan_howard", email: "jack@yahoo.com", password: "12341234")
      user = User.create(username: "jack_noble", email: "jack@yahoo.com", password: "password")
      expect(user.valid?).to eq false
    end
  end

end
