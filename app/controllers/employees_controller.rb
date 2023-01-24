class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee, notice: 'Employee was successfully created.' 
    else
      render :new 
    end 
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.' 
  end

  def taxes
    @employees = Employee.all
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:employee_id, :first_name, :last_name, :email, :phone_number, :date_of_join, :salary)
    end
end
