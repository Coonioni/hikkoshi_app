require 'test_helper'

class TagTest < ActiveSupport::TestCase
  
  setup do
    @tag = Tag.new(id: 1,tag_name: "東京")
  end

  test "Tag is uniquness true" do
    tag = @tag.dup
    @tag.save
    assert_not tag.valid?
  end

  test "Tag presence is true" do
    tag = Tag.new(id: 1, tag_name: "")
    tag.save
    assert_not tag.valid?
  end

  test "Tag name has 1" do
    @tag.tag_name = "n"
    @tag.save
    assert @tag.valid?
  end

  test "tag name has 15" do
    @tag.tag_name = "n" * 15
    @tag.save
    assert @tag.valid?
  end

  test "Tag name has 16" do
    @tag.tag_name = "n" * 16
    @tag.save
    assert @tag.valid?
  end

end
