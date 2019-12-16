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
    @this_month_days = Day.where(pay_slip_id: @pay_slip)
  end

  def new
    @pay_slip = PaySlip.new()
  end

  def create
    @pay_slip = PaySlip.new(pay_slip_params)
    @pay_slip.salary = @salary
    if @pay_slip.save!
      @pay_slip_first_day = @pay_slip.month.to_date
      @pay_slip_last_day = end_of_month(@pay_slip_first_day)
      @this_month_days = month_date_array(@pay_slip_first_day, @pay_slip_last_day)
      generate_days_entries(@salary,@pay_slip,@this_month_days)
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

  #  create an array of all possible date in the array bewteen  @pay_slip_first_day & @pay_slip_last_day
  def month_date_array(date_begin, date_end)
    days = []
    date_begin.step(date_end).each{|d| days.push(d)}
    return days
  end


  #  for each element of the @days array create a Day class element that, depending on it weekday takes the default parameters defined in the salary
  def generate_days_entries(salary, pay_slip, array_of_days)
    std_starting_hours = salary.starting_hour
    std_ending_hours  = salary.ending_hour
    std_meals = salary.daily_meals
    week_days = [1,2,3,4,5]
    # TODO need a way to get the date of bank holliday in france. this gem seems nice :
    # https://github.com/gocardless/business I could use it's method business_day? false + not a week end (saturday? sunday?)
    array_of_days.each do |d|
      if week_days.include?(d.wday)
        a =  Day.new(day_date: d,
                     pay_slip_id: pay_slip.id,
                     status: "worked",
                     starting_hour: std_starting_hours,
                     ending_hour: std_ending_hours,
                     daily_meal: std_meals)
        a.save!
      else
        a = Day.new(day_date: d,
                    pay_slip_id: pay_slip.id,
                    status: "weekend",
                    starting_hour: Time.new(0),
                    ending_hour: Time.new(0),
                    daily_meal: 0)
        a.save
      end
    end
    # if it s a week day
    # create a days with :day_date,  :status, :starting_hour, :ending_hour, :daily_meal
    # if it's a week end day
    # create a day with :day_date, :status "week end", starting_hour: 00:00 endin_hour: 00:00, daily_meal: 0
  end


end
