class CreateOwnedByUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_by_users do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :amount

      t.timestamps
    end
  end
end
