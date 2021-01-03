class RemoveRoomIdFromPatients < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :room_id, :integer 
  end
end
