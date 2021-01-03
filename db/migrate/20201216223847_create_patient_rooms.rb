class CreatePatientRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_rooms do |t|
      t.integer :room_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
