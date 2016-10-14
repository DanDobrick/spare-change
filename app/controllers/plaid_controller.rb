class PlaidController < ApplicationController

  def create
    public_token = params[:public_token]
    metadata = params[:metadata]
    account_id = metadata['account_id']
    # binding.pry
    # exchange_token_response = Plaid::User.exchange_token(public_token, account_id)
    # @user = Plaid::User.load(:auth, exchange_token_response.access_token)
    # @user.auth
  end

end