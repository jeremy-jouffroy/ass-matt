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
# belongs_to :pay_slip

class Day < ApplicationRecord
  belongs_to :pay_slip

  validates :status, inclusion: { in: ["worked", "weekend", "paid-leave", "unpaid-leave", "stayed at home"],  message: "%{value} n'est pas un type de contract valide" }
  validates_uniqueness_of :day_date, scope: :pay_slip_id,  message: "%{day_date} was already filled in for this pay slip"


end
