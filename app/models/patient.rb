class Patient < ApplicationRecord
    has_many :prescriptions 
    has_many :nurse_patients 
    has_many :nurses, through: :nurse_patients
end
