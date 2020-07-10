class AddStatusToOwnedByUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :owned_by_users, :status, :integer, default: 0
  end
end
