class SalariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
  end

  def show
  end

  def new
    @salary = Salary.new(salary_params)

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def salary_params
    params.require(:salary).permit(:contract_type,
                                   )
  end

  def set_user
    @user = current_user
  end
end
