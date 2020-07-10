class Trade < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :listing

  validates_presence_of :buyer_id, :listing_id, :date
  monetize :purchase_price_cents, allow_nil: true

  def stock_id
    self.listing.stock_id
  end

  def num_of_stocks
    self.listing.amount
  end

  def trade_price
    self.listing.price.format
  end

  def total_cost_read
    (self.listing.price * self.listing.amount).format
  end

  def total_cost_write
    self.listing.price * self.listing.amount
  end

end