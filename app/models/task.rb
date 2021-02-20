class Task < ApplicationRecord
    belongs_to :category

    validates :name, 
        presence:true

    validates :due_date,
        presence:true

    # task description not required
end
