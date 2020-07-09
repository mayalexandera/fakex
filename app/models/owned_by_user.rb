class OwnedByUser < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :amount, presence: true, numericality: { only_integer: true }
  validates :user, presence: true, uniqueness: { scope: :stock, message: 'User can only be entered once' }
  validates :stock, presence: true, uniqueness: { scope: :user, message: 'Stock id can only be entered once' }
   monetize :purchase_price_cents, allow_nil: true

  def stock_unit_price
    self.purchase_price.format
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
        purchase_price: listing.price
      )
    end
      
  end

  def stock_symbol
    self.stock.symbol
  end

  def self.create_or_update(user, listing)
    if OwnedByUser.find_user(user, listing)
      record = OwnedByUser.find_by(user_id: user.id, stock_id: listing.stock_id)
      record.update!(
        amount: record.amount + listing.amount
      )
    else
      OwnedByUser.create!(
        user_id: user.id,
        stock_id: listing.stock_id, 
        amount: listing.amount,
        purchase_price: listing.price
      )
    end
  end



  

end
