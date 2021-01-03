class Patient < ApplicationRecord
    has_one :address 
    has_many :vitals 
    has_many :body_masses 
    has_many :prescription_patients
    has_many :prescriptions, through: :prescription_patients

    has_many :nurse_patients 
    has_many :nurses, through: :nurse_patients
    
    has_one :patient_room
    has_one :room, through: :patient_room
    

    accepts_nested_attributes_for :address
    accepts_nested_attributes_for :prescriptions
    accepts_nested_attributes_for :room
    # accepts_nested_attributes_for :vitals 
    # accepts_nested_attributes_for :body_masses 


    # prescriptions this hour 
    def prescriptions_this_hour(time)
        self.prescriptions.where(:delivery_time => time.beginning_of_hour..time.end_of_hour)
    end
    # over_due_prescriptions
    def over_due_prescriptions(time)
        self.prescriptions.where("delivery_time < ?", time.beginning_of_hour)
    end

    def has_over_due_prescription?(time)
        !over_due_prescriptions(time).empty?
    end
    def has_prescriptions_this_hour?(time)
        !prescriptions_this_hour(time).empty?
    end

    def room_attributes=(attributes)
        self.room.update(attributes)
    end

    def prescriptions_attributes=(prescriptions_attributes)
        
        prescriptions_attributes.values.each do |prescription_attribute|
          if !prescription_attribute.empty?
            prescription = Prescription.create(prescription_attribute)
            self.prescriptions << prescription 
          end
        end
    end

    # def vitals_attributes=(vitals_attributes)

    #     vitals_attributes.values.each do |vital_attribute|
    #       if !vital_attribute.empty?
    #         vital = Vital.create(vital_attribute)
    #         self.vitals << vital
    #       end
    #     end
    # end
    # def body_masses_attributes=(body_masses_attributes)
        
    #     body_masses_attributes.values.each do |body_mass_attribute|
    #       if !body_mass_attribute.empty?
    #         body_mass = BodyMass.create(body_mass_attribute)
    #         self.body_masses << body_mass
    #       end
    #     end
    # end
    
    def prescription_ids=(attributes)
        attributes.each do |id|
            if !id.empty?
                self.prescriptions.where(id: id).last.save
            end
        end
    end
end
