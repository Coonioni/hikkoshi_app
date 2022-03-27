require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = Tag.new(id: 1,tag_name: "Tokyo")
  end

  test "Tag is uniquness true" do
    tag = @tag.dup
    @tag.save
    assert_not tag.valid?
  end
end
