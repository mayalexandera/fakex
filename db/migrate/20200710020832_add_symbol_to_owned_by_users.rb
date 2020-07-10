class AddSymbolToOwnedByUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :owned_by_users, :stock_symbol, :string
  end
end
