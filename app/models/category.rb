class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks
    
    validates :name, 
        presence:true
    validates :description, 
        presence:true, 
        length: {
            minimum: 3,
            maximum: 280
            }
            
end
