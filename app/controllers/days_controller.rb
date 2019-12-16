class DaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pay_slip, :set_salary_setup

  def index
  end

  def show
    @day = Day.find(params[:id])
  end

  def new
    @day = Day.new()
  end

  def create
    @day = Day.new(day_params)
    @day.pay_slip = @pay_slip
    if @day.save!
        redirect_to salary_pay_slip_path(@salary, @pay_slip)
    else
      alert
      render :new
    end
  end

  def edit
    @day = Day.find(params[:id])
  end

  def update
    @day = Day.find(params[:id])
    @day.update(day_params)
    redirect_to salary_pay_slip_path(@salary,@pay_slip)
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
    params.require(:day).permit(:day_date, :status, :starting_hour, :ending_hour, :daily_meal)
  end
end
