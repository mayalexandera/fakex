class AddDefaultToUserAmount < ActiveRecord::Migration[6.0]
  def change
    change_column :owned_by_users, :amount, :integer, default: 0
  end
end
