# Salary Schema
# id: integer
# user_id: integer
# contract_type: string
# hourly_rate_cents: integer
# hourly_rate_currency: string
# starting_hour: time
# ending_hour: time
# day_per_week: integer
# working_on_banks_holliday: boolean
# cleaning_cost_cents: integer
# cleaning_cost_currency: string
# meal_cost_cents: integer
# meal_cost_currency: string
# daily_meals: integer
# created_at: datetime
# updated_at: datetime
# belongs_to :user
# has_many :pay_slips

class Salary < ApplicationRecord
  belongs_to :user
  has_many :pay_slips

  #validations
  validates :contract_type, :hourly_rate_cents, :starting_hour, :ending_hour, :day_per_week,  presence: true
  validates :contract_type, inclusion: { in: %w(mensualisé horaire),  message: "%{value} n'est pas un type de contract valide" }
  # custom validation function
 # validates :starting_hour_is_before_ending_hour



  #money rails
  monetize :hourly_rate_cents, with_model_currency: :currency
  monetize :meal_cost_cents, with_model_currency: :currency
  monetize :cleaning_cost_cents, with_model_currency: :currency

  def starting_hour_is_before_ending_hour
    if starting_hour > ending_hour
      errors.add(:starting_hour, "can't be greater than ending_hour")
    end
  end


end
