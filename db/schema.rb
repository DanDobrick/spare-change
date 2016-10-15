# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161015171452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charities", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "bank_info",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "donor_id",    null: false
    t.integer  "charity_id",  null: false
    t.decimal  "user_bucket", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "donor_id",   null: false
    t.decimal  "amount",     null: false
    t.string   "merchant",   null: false
    t.datetime "date",       null: false
    t.boolean  "pending?",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                              null: false
    t.string   "password_digest",                    null: false
    t.string   "first_name",                         null: false
    t.string   "last_name",                          null: false
    t.string   "plaid_id"
    t.string   "stripe_account"
    t.decimal  "bucket",               default: 0.0, null: false
    t.string   "current_charity_ein"
    t.string   "current_charity_name"
    t.string   "last_purchase"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "account_id"
    t.string   "rounded_transactions", default: [],               array: true
  end

end
