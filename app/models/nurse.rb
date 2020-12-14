class Nurse < ApplicationRecord
    has_many :nurse_patients 
    has_many :patients, through: :nurse_patients
end
