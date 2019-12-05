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

ActiveRecord::Schema.define(version: 2019_12_05_143404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.date "day_date"
    t.bigint "pay_slip_id"
    t.string "status"
    t.time "starting_hour"
    t.time "ending_hour"
    t.integer "daily_meal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pay_slip_id"], name: "index_days_on_pay_slip_id"
  end

  create_table "pay_slips", force: :cascade do |t|
    t.datetime "month"
    t.bigint "salary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salary_id"], name: "index_pay_slips_on_salary_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.bigint "user_id"
    t.string "contract_type"
    t.integer "hourly_rate_cents", default: 0, null: false
    t.string "hourly_rate_currency", default: "EUR", null: false
    t.time "starting_hour"
    t.time "ending_hour"
    t.integer "day_per_week"
    t.boolean "working_on_banks_holliday"
    t.integer "cleaning_cost_cents", default: 0, null: false
    t.string "cleaning_cost_currency", default: "EUR", null: false
    t.integer "meal_cost_cents", default: 0, null: false
    t.string "meal_cost_currency", default: "EUR", null: false
    t.integer "daily_meals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_salaries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "days", "pay_slips"
  add_foreign_key "pay_slips", "salaries"
  add_foreign_key "salaries", "users"
end
