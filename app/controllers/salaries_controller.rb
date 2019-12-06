class SalariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @salaries = Salary.where(user_id: @user)
  end

  def show
    @salary = Salary.find(params[:id])
  end

  def new
    @salary = Salary.new()
  end

  def create
    @salary = Salary.new(salary_params)
    @salary.user = @user
    if @salary.save
      redirect_to salary_path(@salary)
    else
      binding.pry
      # render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def salary_params
    params.require(:salary).permit(:contract_type, :hourly_rate_cents, :starting_hour, :ending_hour, :day_per_week, :working_on_banks_holliday, :cleaning_cost_cents, :meal_cost_cents, :daily_meals)
  end

  def set_user
    @user = current_user
  end
end
