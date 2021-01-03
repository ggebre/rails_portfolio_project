class Vital < ApplicationRecord
    belongs_to :patient 
    # validates :temperature, :pressure, :pulse 
end
