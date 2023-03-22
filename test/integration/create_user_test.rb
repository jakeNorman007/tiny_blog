require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

  test "create new user on sign up" do
    get "/signup"
    assert_template "users/new"
    assert_difference "User.count", 1 do
      post users_path, params:{user:{username: "jake", email: "jake@example.com", password: "password"}}
      follow_redirect!
    end
    assert_match "p", "jake's profile"
  end
end