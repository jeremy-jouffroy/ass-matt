class CreatePaySlips < ActiveRecord::Migration[5.2]
  def change
    create_table :pay_slips do |t|
      t.datetime :month
      t.references :salary, foreign_key: true

      t.timestamps
    end
  end
end
