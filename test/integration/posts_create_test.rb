require 'test_helper'

class PostsCreateTest < ActionDispatch::IntegrationTest

  def setup
    @alice = users(:alice)
    sign_in @alice
  end

  test "unsuccessful post creation" do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "" } }
    end
    assert_not flash.empty?
    follow_redirect!
    assert_select 'div.alert'
  end

  test "successful post creation" do
    content = "Test post"
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: content } }
    end
    assert_not flash.empty?
    follow_redirect!
    assert_select 'div.notice'
    get user_url(@alice)
    assert_match content, response.body
  end
end
