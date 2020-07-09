class AddBuyPriceToOwnedByUsers < ActiveRecord::Migration[6.0]
  def change
    add_monetize :owned_by_users, :purchase_price
  end
end
