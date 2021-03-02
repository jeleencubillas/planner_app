require "test_helper"

class TaskTest < ActiveSupport::TestCase

  test "1. should not save Task without name" do
    task = Task.new
    task.category_id = 2
    task.due_date = 02/27/2021
    task.description = "This is a sample description"
    assert_not task.save, "Saved Task without name"
  end

  test "2. should not save Task without category" do
    task = Task.new
    task.name = "Sample Task"
    task.due_date = 02/27/2021
    task.description = "This is a sample description"
    assert_not task.save, "Saved Task without category"
  end

  test "3. should not save Task without due date" do
    task = Task.new
    task.name = "Sample Task"
    task.category_id = 2
    task.description = "This is a sample description"
    assert_not task.save, "Saved Task without due date"
  end
    
  # No validation for task description, it is optional

end