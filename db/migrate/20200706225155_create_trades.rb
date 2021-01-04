class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :buyer_id
      t.references :listing, foreign_key: true
      t.datetime :date

      t.timestamps 
    end
  end
end
