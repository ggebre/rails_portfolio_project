class AddNurseIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nurse_id, :integer 
  end
end
