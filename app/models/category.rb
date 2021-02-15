class Category < ApplicationRecord
    validates :name, 
        presence:true
    validates :description, 
        presence:true, 
        length: {
            minimum: 3,
            maximum: 280
            }
            
    has_many :tasks
end
