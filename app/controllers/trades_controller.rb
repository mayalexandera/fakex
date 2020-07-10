class TradesController < ApplicationController
  before_action :set_trade, only: [:edit, :update, :show, :destroy]

  def index
    @trades = Trade.where(buyer_id: current_user.id)
  end

  def new
    @user = current_user
    @listing = Listing.find(params[:listing_id])
    @trade = Trade.new(listing_id: @listing.id, buyer_id: @user.id, date: Date.new)
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @user = User.find(params[:user])
    
    if @user.account_balance >= @listing.total_listing_price
      
      @trade = Trade.create!(
          listing_id: @listing.id, 
          buyer_id: @user.id,
          date: Date.new,
          purchase_price: @listing.price
      )

      OwnedByUser.create_or_update(@user, @listing)
 
      @user.buy_stock(@trade)
      @listing.seller.sell_stock(@trade)
      @listing.update!(status: 1)
      redirect_to user_trades_path(@user)
      flash[:notice] = "Purchase was successful"
    else
      flash[:alert] = "You do not have enough funds for this trade"
      render :index
    end
  end

  def destroy
    @trade.destroy
    redirect_to trades_path
  end

  def update
    @trade.update(trade_params)
    redirect_to @trade if @trade.save
    flash[:errors] = @trade.errors.full_messages
    render :edit
  end

  private
  
  def set_trade
    @trade = Trade.find(params[:id])
  end

  def trade_params
    params.require(:trade).permit(:buyer_id, :listing_id, :date)
  end
end
