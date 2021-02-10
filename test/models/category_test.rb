require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  
  test "1. should not save Category without name" do
    cat = Category.new
    cat.description = "This is a sample description"
    assert_not cat.save, "Saved Category without name"
  end
    
  test "2. should not save Category without description" do
    cat = Category.new
    cat.name = "Category"
    assert_not cat.save, "Saved Category without description"
  end

  test "3. should not save Category with description less than 3 characters" do
    cat = Category.new
    cat.name = "Category"
    cat.description = "Th"
    assert_not cat.save, "Saved Category with description less than 3 characters"
  end

  test "4. should not save Category with description more than 280 characters" do
    cat = Category.new
    cat.name = "Category"
    cat.description = "This description is more than 280 characters--307, to be exact. Why 280 characters and not 220, 20, or 300? Because we are a bunch of Twitter wannabees. If this test is working, it should throw an error when a description is more than 280 characters. It can be implemented by adding validation to the model."
    assert_not cat.save, "Saved Category with description more than 280 characters"
  end
end
