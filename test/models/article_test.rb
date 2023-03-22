require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = Article.new(title: "Test Article", description: "Here is a test description for the test articles")
  end

  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end

  test "title shouldn't be too long" do
    @article.title = "a" * 51
    assert_not @article.valid?
  end

  test "title shouldn't be too short" do
    @article.title = "aa"
    assert_not @article.valid?
  end

  test "description should be present" do
    @article.description = " "
    assert_not @article.valid?
  end

  test "description shouldn't be too long" do
    @article.description = "a" * 1001
    assert_not @article.valid?
  end

  test "description shouldn't be too short" do
    @article.description = "a"
    assert_not @article.valid?
  end
end
