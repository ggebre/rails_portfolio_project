class AddUidToNurses < ActiveRecord::Migration[6.0]
  def change
    add_column :nurses, :uid, :string 
  end
end
