require "test_helper"

class CreateTaskTest < ActionDispatch::IntegrationTest

    test "should go to new Task form and create new Task" do
        # go to new category path
        get new_task_path
        assert_response :success

        # submit form
        assert_difference "Task.count", 1 do
            post tasks_path, params: { task: { name: "Test", description: "This is a sample description", category_id: 2 }}
            assert_response :redirect
        end

        # after submit
        follow_redirect!
        assert_response :success
    end
end