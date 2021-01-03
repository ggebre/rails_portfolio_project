class AddRoomIdToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :room_id, :integer
  end
end
