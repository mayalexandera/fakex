class ChangeAmountOnOwnedByUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :balance, :integer
    add_monetize :users, :account_balance
  end
end
