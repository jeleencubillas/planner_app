require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest

  # setup test task
  setup do
    @task = tasks(:one)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "1. should get index" do
    get tasks_path
    assert_response :success
  end

  test "2. should get new" do
    get new_task_path
    assert_response :success
  end

  test "3. should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "4. should get edit task" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "5. should update task" do
    # update name
    patch task_path(@task), params: { task: { name: "Updated" } }
    assert_redirected_to task_path(@task), "Redirect not working"
    
    # test updated name
    @task.reload
    assert_equal "Updated", @task.name, "Task name not updated"
  end

  test "6. should destroy task" do
    # delete task
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end
    # redirect to index
    assert_redirected_to tasks_path
  end
end
