class Gift < ApplicationRecord
    
    scope :search_gifts, -> { where("name LIKE ?", "%" + params[:q] + "%") }
   
    belongs_to :user
    belongs_to :list

    accepts_nested_attributes_for :list

    validates :name, presence: true
    validates :store, presence: true
    validates :price, presence: true

end
