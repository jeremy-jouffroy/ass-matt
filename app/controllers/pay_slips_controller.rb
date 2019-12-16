class PaySlipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_salary_setup


  def index
    @payslips = PaySlip.where(salary: @salary)
  end

  def show
    @pay_slip = PaySlip.find(params[:id])
    @pay_slip_first_day = @pay_slip.month.to_date
    @pay_slip_last_day = end_of_month(@pay_slip_first_day)
    @this_month_days = month_date_array(@pay_slip_first_day, @pay_slip_last_day)
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

  def end_of_month(beginning_of_the_month)
    return Date.new(beginning_of_the_month.year, beginning_of_the_month.month, -1)
  end

  # TODO create an array of all possible date in the array bewteen  @pay_slip_first_day & @pay_slip_last_day
  def month_date_array(date_begin, date_end)
    days = []
    date_begin.step(date_end).each{|d| days.push(d)}
    return days
  end


  # TODO for each element of the @days array create a Day class element that, depending on it weekday takes the default parameters defined in the salary


end
