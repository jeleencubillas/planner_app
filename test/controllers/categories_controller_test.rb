require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "1. should get index" do
    get categories_path
    assert_response :success
  end

  test "2. should get new" do
    get new_category_path
    assert_response :success
  end

  # setup test category
  def setup
    @category = categories(:one)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "3. should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "4. should get edit category" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "5. should update category" do
    # update name
    patch category_url(@category), params: { category: { name: "Updated" } }
    assert_redirected_to category_path(@category)
    
    # test updated name
    @category.reload
    assert_equal "Updated", @category.name
  end

  test "6. should destroy category" do
    # delete category
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end
    # redirect to index
    assert_redirected_to categories_path
  end
end
