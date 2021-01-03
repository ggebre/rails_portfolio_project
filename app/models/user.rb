class User < ApplicationRecord
    belongs_to :nurse 
    has_secure_password 
    
    validates :email, presence: true, uniqueness: true
end
