require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest

  test "should redirect create when not logged in" do
    assert_no_difference 'Friendship.count' do
      post friendships_path
    end
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Friendship.count' do
      delete friendship_path(friendships(:bob_followers_1))
    end
    assert_redirected_to new_user_session_path
  end
end
