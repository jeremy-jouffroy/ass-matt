

class Salary < ApplicationRecord
  belongs_to :user
  has_many :pay_slips

end
