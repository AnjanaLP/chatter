require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase

  def setup
    @friendship = Friendship.new(follower_id: users(:bob).id,
                                 followed_id: users(:alice).id)
  end

  test "friendship is valid" do
    assert @friendship.valid?
  end

  test "follower_id should be required" do
    @friendship.follower_id = nil
    assert_not @friendship.valid?
  end

  test "followed_id should be required" do
    @friendship.followed_id = nil
    assert_not @friendship.valid?
  end
end
