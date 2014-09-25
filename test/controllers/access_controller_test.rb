require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get log_in" do
    get :log_in
    assert_response :success
  end

end
