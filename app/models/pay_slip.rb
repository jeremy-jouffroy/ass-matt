# PaySlip schema
# id: integer
# month: datetime
# salary_id: integer
# created_at: datetime
# updated_at: datetime
belongs_to :salary

class PaySlip < ApplicationRecord
  belongs_to :salary
end
