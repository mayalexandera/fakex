class OwnedByUsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
  end

  private
  def owned_by_user_params
    params.require(:owned_by_user).permit(:amount, :trade_id, :stock_id, :user_id, :purchase_price, :purchase_price_currency, :stock_symbol)
  end
end