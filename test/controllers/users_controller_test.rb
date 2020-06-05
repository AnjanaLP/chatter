require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @bob = users(:bob)
  end

  test "should get show" do
    get user_path @bob
    assert_response :success
  end

  test "should get index" do
    sign_in @bob
    get users_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end
end
