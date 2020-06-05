require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  def setup
    @bob = users(:bob)
  end

  test "profile page" do
    get user_path(@bob)
    assert_template 'users/show'
    assert_select "title", full_title(@bob.name)
    assert_select "h2", text: @bob.name
  end
end
