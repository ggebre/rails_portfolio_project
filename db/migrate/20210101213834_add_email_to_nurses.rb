class AddEmailToNurses < ActiveRecord::Migration[6.0]
  def change
    add_column :nurses, :email, :string 
  end
end
