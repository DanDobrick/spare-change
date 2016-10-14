class PlaidController < ApplicationController

  def create
    # public_token = params[:public_token]
    # metadata = params[:metadata]
    # account_id = metadata['account_id']
    # exchange_token_response = Plaid::User.exchange_token(public_token, account_id)
    # stripe_bank_token = exchange_token_response.stripe_bank_account_token
    # access_token = exchange_token_response.access_token
    # # current_user.plaid_id = access_token
    # @user = Plaid::User.load(:auth, access_token)
    # @user.auth
    old_user = User.load(:connect, access_token)

    binding.pry
  end
# to check user transactions AFTER THEYVE ALREADY SIGNED UP
# old_user.transactions
# @user.upgrade(:connect) allows us to get transactions
end
