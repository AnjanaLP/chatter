require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Test User",
                    email: "test@example.com",
                    password: "foobar",
                    password_confirmation: "foobar")
  end

  test "user is valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "name should not exceed 50 characters" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "deleting a user should delete that user's posts" do
    @user.save
    @user.posts.create!(content: "Test post")
    assert_difference 'Post.count', -1 do
      @user.destroy
    end
  end

  test "a user can follow and unfollow another user" do
    bob = users(:bob)
    alice = users(:alice)
    assert_not bob.followers.include?(alice)
    assert_not alice.following.include?(bob)
    assert_not alice.following?(bob)
    alice.follow(bob)
    assert bob.followers.include?(alice)
    assert alice.following.include?(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not bob.followers.include?(alice)
    assert_not alice.following.include?(bob)
    assert_not alice.following?(bob)
  end
end
