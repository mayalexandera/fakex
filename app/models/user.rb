require 'bcrypt'

class User < ApplicationRecord
  has_many :trades, class_name: "Trade", foreign_key: "buyer_id"
  has_many :listings, class_name: "Listing", foreign_key: "seller_id", dependent: :destroy
  has_many :owned_by_users
  attribute :account_balance

  validates :first_name, length: { minimum: 4 }, presence: true
  validates :last_name, length: { minimum: 4 }, presence: true
  validates :username, uniqueness: true, length: { minimum: 6, maximum: 14 }
  validates :password, length: { minimum: 6, maximum: 14, allow_nil: true }
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  monetize :account_balance_cents, allow_nil: true,
  numericality: { less_than_or_equal_to: 1000000000000 }

  after_initialize :ensure_session_token!

  attr_reader :password
  ###USER AUTH METHODS###
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.save!
    self.session_token
  end

  ### USER METHODS ###
  def stocks
    OwnedByUser.where(user_id: self.id)
  end
  
  def check_stocks
    self.stocks.each do |s|
      s.destroy! if s.amount == 0
    end
  end

  def amount_owned(stock_id)
    stock = stocks.find_by(stock_id: stock_id)
    stock.amount
  end

  def portfolio_value
    return "Portfolio is empty" if stocks.empty?
    stocks.inject(0){ |sum, e| sum + e.total_value }.format
  end

  def sell_stock(trade, seller)
    stock = seller.stocks.find_by(stock_id: trade.stock_id)
    updated = stock.amount - trade.num_of_stocks
    if updated == 0
      stock.destroy!
    else
      stock.update!(amount: updated)
    end
    self.seller_update_account(trade, seller)
  end

  def seller_update_account(trade, seller)
    balance = seller.account_balance
    sold = balance + trade.total_cost_write
    seller.update!(account_balance: sold)
  end

  def buyer_update_account(trade, buyer)
    balance = buyer.account_balance
    bought = balance - trade.total_cost_write
    buyer.update!(account_balance: bought)
  end

  def deposit_update_account(user, attribute)
    current_balance = user.account_balance
    input = attribute.gsub(/\D/,'').to_i
    monetize = Money.new(input, "USD")
    new_balance = current_balance + monetize
    user.update!(account_balance: new_balance)
  end

  private

  def ensure_session_token!
    self.session_token ||= SecureRandom.base64(64)
  end

end