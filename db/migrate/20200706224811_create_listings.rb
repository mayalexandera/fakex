class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :seller_id
      t.references :stock, foreign_key: true
      t.integer :amount
      t.integer :price

      t.timestamps
    end
  end
end
