require 'test_helper'

class FriendshipsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @bob = users(:bob)
  end

  test "a user's followers page including pagination" do
    get followers_user_path(@bob)
    assert_template 'users/followers_and_following'
    assert_select 'title', full_title("#{@bob.name} | Followers")
    assert_select 'a[href=?]', user_path(@bob), text: @bob.name
    assert_match @bob.followers.count.to_s, response.body
    assert_select 'ul.pagination', count: 2
    @bob.followers.paginate(page: 1).each do |follower|
      assert_select 'a[href=?]', user_path(follower), text: follower.name
    end
  end

  test "a user's following page including pagination" do
    get following_user_path(@bob)
    assert_template 'users/followers_and_following'
    assert_select 'title', full_title("#{@bob.name} | Following")
    assert_select 'a[href=?]', user_path(@bob), text: @bob.name
    assert_match @bob.following.count.to_s, response.body
    assert_select 'ul.pagination', count: 2
    @bob.following.paginate(page: 1).each do |following|
      assert_select 'a[href=?]', user_path(following), text: following.name
    end
  end
end
