class DaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pay_slip, :set_salary_setup

  def index
  end

  def show
  end

  def new
    @day = Day.new()
  end

  def create
    @day = Day.new(dasy)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_salary_setup
    @salary = Salary.find(params[:salary_id])
  end

  def set_pay_slip
    @pay_slip = PaySlip.find(params[:pay_slip_id])
  end

  def day_params
    params.require(:pay_slip).permit(:month,:salary_id)
  end
end
