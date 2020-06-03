require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test "devise user registration and account update accepts name attribute" do
    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: { name: "Test User",
                                                     email: "test@example.com",
                                                     password: "foobar",
                                                     password_confirmation: "foobar" }
                                            }
    end

    put user_registration_path, params: { user: { name: "Updated User",
                                                  current_password: "foobar" }
                                        }

    updated_name = User.find_by(email: "test@example.com").reload.name
    assert_equal "Updated User", updated_name
  end
end
