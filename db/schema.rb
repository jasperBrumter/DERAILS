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

ActiveRecord::Schema.define(version: 2018_11_27_201840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "responses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ticket_id"
    t.text "content"
    t.string "contact"
    t.integer "price"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_responses_on_ticket_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "status"
    t.string "photo_1"
    t.string "photo_2"
    t.string "photo_3"
    t.bigint "user_id"
    t.string "city"
    t.string "postal_code"
    t.boolean "tune_up"
    t.boolean "brakes"
    t.boolean "flat_tire"
    t.boolean "chain"
    t.boolean "gears"
    t.boolean "wheels"
    t.boolean "frame"
    t.boolean "other"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.text "specific_details"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "photo"
    t.boolean "is_mechanic"
    t.float "average_rating"
    t.string "last_name"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "responses", "tickets"
  add_foreign_key "responses", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "tickets", "users"
end
