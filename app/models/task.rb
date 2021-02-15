class Task < ApplicationRecord
    belongs_to :category

    validates :name, 
        presence:true

    # task description not required
end
