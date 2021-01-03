class Nurse < ApplicationRecord
    # has_one :user
    has_many :nurse_patients 
    has_many :patients, through: :nurse_patients
    has_many :rooms, through: :patients
    

    def self.nurse_assigned(floors)
        
        floors.each do |floor|
            # floor takes a form of 'nurse_id-floor_id'
            nurse_id = floor.split('-').first 
            floor_id = floor.split('-').last
            # find the floor and find the rooms where a resident is...
            Nurse.find_by(id: nurse_id).patients.clear
            patients = Room.rooms_with_patients(floor_id).map {|room| room.patients}
            
            Nurse.find_by(id: nurse_id).patients << patients
        end
    end
end
