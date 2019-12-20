class Api::V1::DaysController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_pay_slip, :set_salary_setup

  def index
    # @days = policy_scope(Day) TODO put pundit in place
    @days = Day.where(pay_slip_id: @pay_slip)
  end

  private

  def set_salary_setup
    @salary = Salary.find(params[:salary_id])
  end

  def set_pay_slip
    @pay_slip = PaySlip.find(params[:pay_slip_id])
  end

  def day_params
    params.require(:day).permit(:day_date, :status, :starting_hour, :ending_hour, :daily_meal)
  end
end
