class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.belongs_to :category, foreign_key: true
      
      t.timestamps
    end
  end
end
