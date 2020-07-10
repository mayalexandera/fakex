class Listing < ApplicationRecord
  enum status: { active: 0, archived: 1 }
  belongs_to :stock
  belongs_to :seller, class_name: "User"
  attribute :status

  validates :status, presence: true
  validates :seller_id, :stock_id, :price, :amount, presence: true
  monetize :price_cents, allow_nil: true

  def self.active_listings
    Listing.where(status: 0)
  end

  def show_price
    self.price.format
  end

  def seller_name
    self.seller.first_name
  end

  def total_listing_price
    self.price * self.amount
  end

  def verify_listing(stock_id)
    return true if self.seller.amount_owned(stock_id) >= self.amount
  end

 

end