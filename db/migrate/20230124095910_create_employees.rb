class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :employee_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :phone_number
      t.date :date_of_join
      t.integer :salary

      t.timestamps null: false
    end
  end
end
