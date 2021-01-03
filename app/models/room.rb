class Room < ApplicationRecord
    has_many :patient_rooms 
    has_many :patients, through: :patient_rooms
    # validates :floor, :number 
    def self.floors 
        select(:floor).distinct
    end

    def self.rooms_with_patients (floor_number)
         where(floor: floor_number).select {|room| room.patients.count != 0 }
    end
end
