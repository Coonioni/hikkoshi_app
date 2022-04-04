require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  setup do
    @comment = Comment.new(id: 1, post_id: 1, user_id: 1, content: "aaaaa")
  end

  # test "the truth" do
  #   assert true
  # end

  test "User can't comment twice to the same post" do
    comment = @comment.dup
    @comment.save
    assert_not comment.valid?
  end

  test "No text yes can't comment" do
    comment = Comment.new(id:2, post_id: 2, user_id: 2, content: "")
    comment.save
    assert_not comment.valid?
  end

  test "text limited within 170s" do
    @comment.content = 'a' * 171
    @comment.save
    assert_not @comment.valid?
  end

end
