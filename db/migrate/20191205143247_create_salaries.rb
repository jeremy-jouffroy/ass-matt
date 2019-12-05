class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.references :user, foreign_key: true
      t.string :contract_type
      t.monetize :hourly_rate
      t.time :starting_hour
      t.time :ending_hour
      t.integer :day_per_week
      t.boolean :working_on_banks_holliday
      t.monetize :cleaning_cost
      t.monetize :meal_cost
      t.integer :daily_meals
      t.timestamps
    end
  end
end
