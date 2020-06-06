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
end
