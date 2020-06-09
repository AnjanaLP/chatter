require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "Test Content" } }
    end
    assert_redirected_to new_user_session_url
  end
end
