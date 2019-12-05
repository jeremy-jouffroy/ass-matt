class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date :day_date
      t.references :pay_slip, foreign_key: true
      t.string :status
      t.time :starting_hour
      t.time :ending_hour
      t.integer :daily_meal

      t.timestamps
    end
  end
end
