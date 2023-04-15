require "test_helper"

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = Comment.new(content: "test content, for testing.")
  end

  test "comment should not be empty" do
    @comment.content = " "
    assert_not comment.valid?
  end
end
