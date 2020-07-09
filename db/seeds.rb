# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 3.times do |user|
#   User.create!(
#     first_name: "first_name#{user}",
#     last_name: "last_name#{user}",
#     username: "username#{user}",
#     account_balance: rand(45245234)
    
#   )
# end


Company.create!(name: "Apple")
Company.create!(name: "Edel")
Company.create!(name: "Nosay")
Company.create!(name: "Googly")
Company.create!(name: "So Do Ketamine")


Stock.create!(symbol: "AAPL", company_id: 1)
Stock.create!(symbol: "EDL", company_id: 2)
Stock.create!(symbol: "NSA", company_id: 3)
Stock.create!(symbol: "GOOG", company_id: 4)
Stock.create!(symbol: "SDK", company_id: 5)

Listing.create!(seller_id: User.first.id, stock_id: Stock.second.id, price: 44, amount: 4 )
Listing.create!(seller_id: User.first.id, stock_id: Stock.second.id, price: 3, amount: 40)
Listing.create!(seller_id: User.first.id, stock_id: Stock.third.id, price: 0, amount: 50)



#OwnedByUser.create!(user_id: 1, stock_id: 3, purchase_price: 5, amount: 10)
#OwnedByUser.create!(user_id: 1, stock_id: 5, purchase_price: 5, amount: 15)
#OwnedByUser.create!(user_id: 2, stock_id: 1, purchase_price: 5, amount: 5)
#OwnedByUser.create!(user_id: 2, stock_id: 3, purchase_price: 5, amount: 15)
#OwnedByUser.create!(user_id: 2, stock_id: 2, purchase_price: 5, amount: 7)
#OwnedByUser.create!(user_id: 3, stock_id: 1, purchase_price: 5, amount: 2)
#OwnedByUser.create!(user_id: 3, stock_id: 4, purchase_price: 5, amount: 20)
#OwnedByUser.create!(user_id: 3, stock_id: 2, purchase_price: 5, amount: 15)

