class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks, :dependent => :delete_all 
    
    validates :name, 
        presence:true
        
    validates :description, 
        presence:true, 
        length: {
            minimum: 3,
            maximum: 280
            }

    validates :color,
        presence: true,
        format: { with: /\A#(?:[0-9a-fA-F]{3}){1,2}\z/ }
        
end
