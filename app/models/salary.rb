# create_table "salaries", force: :cascade do |t|
#   t.bigint "user_id"
#   t.string "contract_type"
#   t.integer "hourly_rate"
#   t.time "starting_hour"
#   t.time "ending_hour"
#   t.integer "day_per_week"
#   t.boolean "working_on_banks_holliday"
#   t.integer "cleaning_cost"
#   t.integer "meal_cost"
#   t.integer "daily_meals"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_salaries_on_user_id"
# end

class Salary < ApplicationRecord
  belongs_to :user
  has_many :pay_slips

  validates()
end
