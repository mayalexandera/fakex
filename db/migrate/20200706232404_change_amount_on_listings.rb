class ChangeAmountOnListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :price
    add_monetize :listings, :price
  end
end
