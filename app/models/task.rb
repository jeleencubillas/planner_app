class Task < ApplicationRecord
    belongs_to :category

    validates :name, 
        presence:true

    validates :due_date,
        presence:true

    scope :tasks_today, -> { where("due_date = ?", Date.today) }
    
    # task description not required
end
