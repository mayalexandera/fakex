# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_09_004026) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer "seller_id"
    t.integer "stock_id"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.integer "status", default: 0
    t.index ["stock_id"], name: "index_listings_on_stock_id"
  end

  create_table "owned_by_users", force: :cascade do |t|
    t.integer "amount", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "purchase_price_cents", default: 0, null: false
    t.string "purchase_price_currency", default: "USD", null: false
    t.integer "trade_id"
    t.integer "user_id"
    t.integer "stock_id"
    t.index ["stock_id"], name: "index_owned_by_users_on_stock_id"
    t.index ["trade_id"], name: "index_owned_by_users_on_trade_id"
    t.index ["user_id"], name: "index_owned_by_users_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.integer "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_stocks_on_company_id"
  end

  create_table "trades", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "listing_id"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "purchase_price_cents", default: 0, null: false
    t.string "purchase_price_currency", default: "USD", null: false
    t.index ["listing_id"], name: "index_trades_on_listing_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_balance_cents", default: 0, null: false
    t.string "account_balance_currency", default: "USD", null: false
    t.string "password_digest"
    t.string "session_token"
  end

  add_foreign_key "listings", "stocks"
  add_foreign_key "owned_by_users", "stocks"
  add_foreign_key "owned_by_users", "users"
  add_foreign_key "stocks", "companies"
  add_foreign_key "trades", "listings"
end
