class AddForeignKeyToCategories < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :categories, :users
  end
end
