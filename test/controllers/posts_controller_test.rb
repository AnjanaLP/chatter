require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "Test Content" } }
    end
    assert_redirected_to new_user_session_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete post_path(posts(:one))
    end
    assert_redirected_to new_user_session_url
  end

  test "should redirect destroy when not logged in as the post owner" do
    sign_in users(:alice)
    bob_post = posts(:one)
    assert_no_difference 'Post.count' do
      delete post_path(bob_post)
    end
    assert_redirected_to root_url
  end
end
