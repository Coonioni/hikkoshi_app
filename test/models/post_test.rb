require 'test_helper'

class PostTest < ActiveSupport::TestCase

  setup do
    @post = Post.new(post_content: "いい感じ", address: "chouhu", user_id: 1)
  end

  test "this post can be saved" do
    post = @post
    @tag = post.tags
    assert post.save
  end

end
