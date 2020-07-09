class StocksController < ApplicationController
  def index
    @stocks = Stock.all.select{ |s| s.active? }
  end
end