require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @bob = users(:bob)
    @post = @bob.posts.build(content: "Test post")
  end

  test "post is valid" do
    assert @post.valid?
  end

  test "content should be present" do
    @post.content = "    "
    assert_not @post.valid?
  end

  test "content should not exceed 300 characters" do
    @post.content = "a" * 301
    assert_not @post.valid?
  end

  test "posts should be retrieved in reverse chronological order" do
    assert_equal posts(:bob_latest_post), @bob.posts.first
  end
end
