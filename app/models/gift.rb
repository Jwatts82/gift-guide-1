class Gift < ApplicationRecord
    
    scope :search_gifts, -> (giftname) { where("name LIKE ?", "%#{giftname}%") }
   
    belongs_to :user
    belongs_to :list

    accepts_nested_attributes_for :list

    validates :name, presence: true
    validates :store, presence: true
    validates :price, presence: true

end
