require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  def setup
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test "profile page including paginated posts" do
    get user_path(@alice)
    assert_template 'users/show'
    assert_select "title", full_title(@alice.name)
    assert_select "h1", text: @alice.name
    assert_select 'a[href=?]', followers_user_path(@alice), text: "#{@alice.followers.count} Followers"
    assert_select 'a[href=?]', following_user_path(@alice), text: "#{@alice.following.count} Following"
    assert_match @alice.posts.count.to_s, response.body
    assert_select 'ul.pagination'
    @alice.posts.paginate(page: 1).each do |post|
      assert_select 'i.fa-user'
      assert_select 'a[href=?]', user_path(post.user), text: post.user.name
      assert_match post.content, response.body
      assert_select 'a[href=?]', post_path(post), text: "delete", count: 0
    end
    assert_select 'form', count: 0
    sign_in @alice
    get user_path(@alice)
    assert_select 'form'
    @alice.posts.paginate(page: 1).each do |post|
      assert_select 'a[href=?]', post_path(post), text: "delete"
    end
    get user_path @bob
    assert_select 'form', count: 0
    assert_select 'a', text: 'delete', count: 0
  end
end
