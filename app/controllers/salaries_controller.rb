class SalariesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @user = current_user

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
  set_user
end
