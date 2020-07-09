class Stock < ApplicationRecord
    has_many :listings
    has_many :users, through: :owned_by_users

  def active?
    true if self.active_listings
  end

  def active_listings
    self.listings.where(status: 'active').count > 1
  end

end

