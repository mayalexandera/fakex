class AddIndexToUserId < ActiveRecord::Migration[6.0]
  def change
    remove_column :owned_by_users, :user_id, :integer
    remove_column :owned_by_users, :stock_id, :integer
    add_reference :owned_by_users, :user, foreign_key: true
    add_reference :owned_by_users, :stock, foreign_key: true
  end
end