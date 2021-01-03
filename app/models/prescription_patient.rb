class PrescriptionPatient < ApplicationRecord
    belongs_to :patient 
    belongs_to :prescription 
end
