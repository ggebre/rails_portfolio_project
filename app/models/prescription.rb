class Prescription < ApplicationRecord
    has_many :prescription_patients
    has_many :patients, through: :prescription_patients
    
    validates :name, presence: true
    validates :dose, presence: true
    validates :frequency, presence: true
    validates :quantity, presence: true

    after_save :delivery_time_updater! 
    # filter prescriptions with given date_time
    def self.prescriptions_this_hour(time)
        where(:delivery_time => time.beginning_of_hour..time.end_of_hour)
    end
    
    def this_hour_prescription? 
         DateTime.now.beginning_of_hour <= self.delivery_time && DateTime.now.end_of_hour >= self.delivery_time
    end

    def over_due_prescription? 
        self.delivery_time < DateTime.now.beginning_of_hour
    end

    def upcoming_prescription?
        !(self.this_hour_prescription? || self.over_due_prescription?) 
    end

    def self.over_due_prescriptions(time)
        where("delivery_time < ?", time.beginning_of_hour)
    end

    private 
    def delivery_time_updater! 
        if(delivery_time.nil?)
            self.update_column(:delivery_time, self.created_at)
        else
            self.update_column(:delivery_time, self.delivery_time + (24.0 / self.frequency).hours)
            self.update_column(:quantity, self.quantity - self.dose)
        end
        
    end

end
