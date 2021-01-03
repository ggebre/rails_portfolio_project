class CreateVitals < ActiveRecord::Migration[6.0]
  def change
    create_table :vitals do |t|
      t.integer :temperature
      t.string :pressure
      t.integer :pulse
      t.integer :patient_id
      t.timestamps
    end
  end
end
