require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  def setup
    @alice = users(:alice)
  end

  test "profile page including paginated posts" do
    get user_path(@alice)
    assert_template 'users/show'
    assert_select "title", full_title(@alice.name)
    assert_select "h1", text: @alice.name
    assert_match @alice.posts.count.to_s, response.body
    assert_select 'ul.pagination'
    @alice.posts.paginate(page: 1).each do |post|
      assert_select 'i.fa-user'
      assert_select 'a[href=?]', user_path(post.user), text: post.user.name
      assert_match post.content, response.body
    end
  end
end
