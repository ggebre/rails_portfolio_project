class CreatePrescriptionPatients < ActiveRecord::Migration[6.0]
  def change
    create_table :prescription_patients do |t|
      t.integer :patient_id
      t.integer :prescription_id

      t.timestamps
    end
  end
end
