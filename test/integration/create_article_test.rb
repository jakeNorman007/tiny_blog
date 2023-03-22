require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "jake", email: "jake@example.com", password: "password", admin: true)
  end

  test "get new article form and create article" do
    sign_in_as(@user)
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: {article:{title: "Test title", description: "Test description for article."}}
      follow_redirect!
    end
    assert_template 'articles/show'
    assert_match 'Test title', response.body
  end
end
