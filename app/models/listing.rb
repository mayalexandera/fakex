class Listing < ApplicationRecord
  enum status: { active: 0, archived: 1 }
  belongs_to :stock
  belongs_to :seller, class_name: "User"

  validates :seller_id, :stock_id, :price, :amount, presence: true
  
  monetize :price_cents, allow_nil: true

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
    #puts "you only have #{self.seller.amount_owned(self.stock_id)} and you're trying #to sell #{self.amount}"
  end

end