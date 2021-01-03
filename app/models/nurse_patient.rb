class NursePatient < ApplicationRecord
    belongs_to :nurse 
    belongs_to :patient 
end
