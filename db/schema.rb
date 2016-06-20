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

ActiveRecord::Schema.define(version: 20160619042837) do

  create_table "customers", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "given_name"
    t.text     "family_name"
    t.text     "company"
    t.text     "email"
    t.text     "address_line1"
    t.text     "address_line2"
    t.string   "city"
    t.text     "region"
    t.text     "zip"
    t.text     "country"
    t.text     "phone"
    t.text     "vat_number"
    t.text     "payment_terms"
    t.text     "vat"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.string   "invoice_number"
    t.datetime "invoice_date"
    t.datetime "due_date"
    t.string   "terms"
    t.text     "message"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "lines", force: :cascade do |t|
    t.integer  "invoice_id"
    t.text     "description"
    t.datetime "date"
    t.integer  "quantity"
    t.text     "unit"
    t.decimal  "unit_price"
    t.decimal  "vat"
    t.decimal  "total"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end