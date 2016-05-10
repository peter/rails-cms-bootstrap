require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "new - should render form" do
    get login_path
    assert_response :success
  end
end
