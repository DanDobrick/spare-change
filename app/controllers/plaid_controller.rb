class PlaidController < ApplicationController

  def create
    # public_token = params[:public_token]
    # metadata = params[:metadata]
    # account_id = metadata['account_id']
    # exchange_token_response = Plaid::User.exchange_token(public_token, account_id)
    # stripe_bank_token = exchange_token_response.stripe_bank_account_token
    # accegit ss_token = exchange_token_response.access_token
    # current_user.plaid_id = access_token
    # @user = Plaid::User.load(:auth, access_token)
    # @user.auth
    old_user = User.load(:connect, access_token)
    # to check user transactions AFTER THEYVE ALREADY SIGNED UP
    # old_user.transactions
    # @user.upgrade(:connect) allows us to get transactions

    access_token = ""
    stripe_token = ''
    # ^ temporary to create Stripe Customer:
    # stripe_user = Stripe::Customer,create(description: 'some description', source: stripe_token)
    # This creates customer in stripe
    # then we need to store stripe_user.id
    # we then retrieve this by Stripe::Customer.retrieve(stripe_user.id)
    # dan = Plaid::User.load(:connect, access_token)
    #
    binding.pry
  end
end
