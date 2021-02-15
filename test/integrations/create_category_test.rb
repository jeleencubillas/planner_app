require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

    test "should go to new Category form and create new Category" do
        # go to new category path
        get new_category_path
        assert_response :success

        # submit form
        assert_difference "Category.count", 1 do
            post categories_path, params: { category: { name: "Test", description: "This is a sample description" }}
            assert_response :redirect
        end

        # after submit
        follow_redirect!
        assert_response :success
    end
end
