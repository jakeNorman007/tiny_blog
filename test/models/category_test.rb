require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end

  test "Category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @categoryTwo = Category.new(name: "Sports")
    assert_not @categoryTwo.valid?
  end

  test "name shouldn't be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name shouldn't be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
end