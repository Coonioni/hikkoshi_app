require 'rails_helper'

  # pending "add some examples to (or delete) #{__FILE__}"

RSpec.describe Post, type: :model do

  it "post_contentは必須である。" do
    user = FactoryBot.create(:user)
    post = user.posts.new(
      post_content: "テスト",
      address: "調布",
      user_id: 1
    )
    expect(post).to be_valid
  end

  it "post_contentがないのでエラーを出す" do
    post = Post.new(
      post_content: nil,
      address: "調布"
    )
    post.valid?
    expect(post.errors[:post_content]).to include("can't be blank")
  end

  it "addressがないのでエラーを出す" do
    post = Post.new(
      post_content: "テスト",
      address: nil
    )
    post.valid?
    expect(post.errors[:address]).to include("can't be blank")
  end
end