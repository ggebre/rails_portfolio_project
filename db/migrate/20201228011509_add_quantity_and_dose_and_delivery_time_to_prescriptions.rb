class AddQuantityAndDoseAndDeliveryTimeToPrescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :prescriptions, :dose, :integer 
    add_column :prescriptions, :quantity, :integer 
    add_column :prescriptions, :delivery_time, :datetime 
  end
end
