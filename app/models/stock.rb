class Stock < ApplicationRecord
    belongs_to :company
    has_many :listings, dependent: :destroy
    has_many :users, through: :owned_by_users
  
  def self.active_stocks
    Listing.active_listings.map { |l| l.stock }.uniq
  end

end

#$241,051.01