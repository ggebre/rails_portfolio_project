class PatientRoom < ApplicationRecord
    belongs_to :room
    belongs_to :patient
end
