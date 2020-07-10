class OwnedByUser < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :amount, presence: true, numericality: { only_integer: true }
  validates :amount, exclusion: { in: [0], message: "You can't have less than zero shares." }
  validates :stock_symbol, presence: true
  validates :user, presence: true, uniqueness: { scope: :stock, message: 'User can only be entered once' }
  validates :stock, presence: true, uniqueness: { scope: :user, message: 'Stock id can only be entered once' }
  monetize :purchase_price_cents, allow_nil: true


  def stock_unit_price_read
    self.purchase_price.format
  end

  def total_value_read
    (self.amount * self.stock_unit_price).format
  end

  def stock_unit_price
    self.purchase_price
  end
  
  def total_value
    (self.amount * self.stock_unit_price)
  end

  def stock_symbol
    self.stock.symbol
  end

  def company_name
   stock = Stock.where(id: self.stock_id)
   Company.where(id: stock.company_id)
  end

  def self.find_user(user, listing)
    return true if OwnedByUser.find_by(
        user_id: user.id,
        stock_id: listing.stock_id
    )
    false
  end

  def update_user(user, listing)
    if OwnedByUser.find_user(user, listing)
      record = OwnedByUser.where(user_id: user.id, stock_id: listing.stock_id)

      record.update!(
        user_id: user.id,
        stock_id: listing.stock_id,
        amount: listing.amount,
        purchase_price: listing.price,
        stock_symbol: listing.stock.symbol
      )
    end
  end

  def self.create_or_update(user, listing)
    if OwnedByUser.find_user(user, listing)
      record = OwnedByUser.find_by(user_id: user.id, stock_id: listing.stock_id)
      record.update!(
        amount: record.amount + listing.amount
      )
    end
      
    OwnedByUser.create!(
      user_id: user.id,
      stock_id: listing.stock_id,
      amount: listing.amount,
      purchase_price: listing.price,
      stock_symbol: listing.stock.symbol
    )
  end

end