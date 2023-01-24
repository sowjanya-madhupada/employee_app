class Employee < ActiveRecord::Base
	validates :first_name, presence: true, length: { maximum: 100 }
    validates :last_name,  presence: true, length: { maximum: 100 }
    validates :email, presence: true, uniqueness: true
    validates :phone_number, :employee_id, presence: true
    validates :date_of_join, :salary, presence: true

    def annual_salary(employee)
    	employee.salary*12
    end

    def tax_amount(employee)
        yearly_salary = annual_salary(employee) 
        unless employee.date_of_join <= Date.parse("01 Apr 2023")
        	yearly_salary = (365-(employee.date_of_join-Date.parse("01 Apr 2023")))*(yearly_salary/365)
        end
    	
    	if yearly_salary <= 250000
    		"no tax"
    	elsif yearly_salary > 250000 && yearly_salary <= 500000
    		yearly_salary*0.05 
    	elsif yearly_salary > 500000 && yearly_salary <= 1000000
    		yearly_salary*0.1
    	else
            yearly_salary*0.2
    	end
	   

    end

    def cess_amount(employee)
    	yearly_salary = annual_salary(employee)
    	if yearly_salary >= 2500000
    		yearly_salary*0.02
    	end
    end
end
