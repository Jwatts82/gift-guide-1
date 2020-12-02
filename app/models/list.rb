class List < ApplicationRecord
    has many :gifts
    has_many :users, through: :gifts
    
end
