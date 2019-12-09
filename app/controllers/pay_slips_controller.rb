class PaySlipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_salary_setup


  def index
    @payslips = PaySlip.where(salary: @salary)
  end

  def show
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
