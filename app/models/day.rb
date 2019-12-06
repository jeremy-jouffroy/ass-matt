# Day schema
# id: integer
# day_date: date
# pay_slip_id: integer
# status: string
# starting_hour: time
# ending_hour: time
# daily_meal: integer
# created_at: datetime
# updated_at: datetime
belongs_to :pay_slip

class Day < ApplicationRecord
  belongs_to :pay_slip
end
