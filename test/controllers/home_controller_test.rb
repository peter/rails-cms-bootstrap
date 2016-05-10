require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "index - should redirect unauthenticated" do
    get root_url
    assert_response :redirect
  end
end
