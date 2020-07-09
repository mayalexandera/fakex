class AddPurchasePriceToTrades < ActiveRecord::Migration[6.0]
  def change
    add_monetize :trades, :purchase_price
  end
end
