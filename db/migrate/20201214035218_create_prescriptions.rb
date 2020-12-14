class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.integer :patient_id
      t.string :description
      t.integer :frequency

      t.timestamps
    end
  end
end
