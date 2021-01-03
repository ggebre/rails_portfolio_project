class CreateBodyMasses < ActiveRecord::Migration[6.0]
  def change
    create_table :body_masses do |t|
      t.integer :weight
      t.integer :height
      t.integer :patient_id
      t.timestamps
    end
  end
end
