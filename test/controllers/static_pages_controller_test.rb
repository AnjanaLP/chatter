require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Chatter"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select 'title', @base_title
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select 'title', "#{@base_title} | Contact"
  end
end
