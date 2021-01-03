class RemovePatientIdFromPrescriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :prescriptions, :patient_id, :integer
  end
end
