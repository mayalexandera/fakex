class StocksController < ApplicationController
  def index
    @stocks = Stock.active_stocks
    if @stocks.nil?
      flash[:notice] = "There are no current listings"
    end
  end

  def show
    @stock = Stock.find(params[:id])
    @listings = Listing.active_listings
  end
end