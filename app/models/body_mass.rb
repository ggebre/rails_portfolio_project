class BodyMass < ApplicationRecord
    belongs_to :patient 

    validates :weight, presence: true
    validates :height, presence: true

end
