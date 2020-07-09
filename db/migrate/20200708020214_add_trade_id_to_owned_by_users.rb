class AddTradeIdToOwnedByUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :owned_by_users, :trade, index: true
  end
end
