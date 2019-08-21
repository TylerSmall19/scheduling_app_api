require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    post auth_login_url, :params => { auth: { :username => "Test", :password => "Password"} }
    assert_response :success
  end

  test "should get logout" do
    post auth_logout_url
    assert_response :success
  end

  test "should get oauth" do
    post auth_oauth_url
    assert_response :success
  end
end
