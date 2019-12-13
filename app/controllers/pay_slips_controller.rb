class PaySlipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_salary_setup


  def index
    @payslips = PaySlip.where(salary: @salary)
  end

  def show
    @pay_slip = PaySlip.find(params[:id])
    @pay_slip_first_day = @pay_slip.month.to_date
    @pay_slip_last_day = Date.new(@pay_slip_first_day.year, @pay_slip_first_day.month, -1)
  end

  def new
    @pay_slip = PaySlip.new()
  end

  def create
    @pay_slip = PaySlip.new(pay_slip_params)
    @pay_slip.salary = @salary
    if @pay_slip.save!
      redirect_to salary_pay_slip_path(@salary, @pay_slip)
    else
      alert
      render :new
    end
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

  def pay_slip_params
    params.require(:pay_slip).permit(:month,:salary_id)
  end
end
