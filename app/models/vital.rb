class Vital < ApplicationRecord
    belongs_to :patient 
    validates :temperature, presence: true
    validates :pressure, presence: true
    validates :pulse, presence: true

end
