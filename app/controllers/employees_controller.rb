class EmployeesController < ApplicationController
    before_action :current_employee, only: [:show, :edit, :update, :destroy ]
    
    def index
        @employees = Employee.all 
    end

    def show
        
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all 
    end

    def create 
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to @employee
        else
            flash[:errors] = @employee.errors.full_messages 
            redirect_to new_employee_path
        end
        redirect_to employee_path(@employee)
    end

    def edit
        @dogs = Dog.all 
    end

    def update 
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.update(employee_params)
            redirect_to @employee
        else
            flash[:errors] = @employee.errors.full_messages 
            redirect_to edit_employee_path
        end
    end 

    def destroy
        @employee.destroy
        redirect_to employees_path
    end


    private 
        def current_employee
            @employee = Employee.find(params[:id])
        end

        def employee_params
            params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id) 
        end

        
end
