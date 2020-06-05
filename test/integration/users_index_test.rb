require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  test "index page including pagination" do
    sign_in(users(:bob))
    get users_path
    assert_template 'users/index'
    assert_select 'ul.pagination', count: 2
    User.paginate(page: 1) do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
end
