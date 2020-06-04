require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @bob = users(:bob)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'title', full_title
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', contact_path
    assert_select 'a[href=?]', new_user_registration_path, count: 2
    assert_select 'a[href=?]', new_user_session_path, count: 2
    sign_in @bob
    get root_path
    assert_select 'a[href=?]', new_user_registration_path, count: 0
    assert_select 'a[href=?]', new_user_session_path, count: 0
    assert_select 'a[href=?]', edit_user_registration_path
    assert_select 'a[href=?]', destroy_user_session_path
    assert_match @bob.name, response.body
    get contact_path
    assert_template 'static_pages/contact'
    assert_select 'title', full_title("Contact")
    sign_out @bob
    get new_user_registration_path
    assert_select 'title', full_title("Register")
    get new_user_session_path
    assert_select 'title', full_title("Log in")
  end
end
