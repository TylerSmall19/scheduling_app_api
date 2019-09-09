require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should return success when valid key is given" do
    ENV["API_KEY"] = "local"

    post auth_login_url + "?api_key=" + ENV["API_KEY"], :params => { auth: { :username => "Test", :password => "Password"} }

    assert_response :success
  end

  test "should give unauthorized when no key is given" do
    post auth_login_url
    assert_response :unauthorized
  end

  test "should give unauthorized when non-matching key is given" do
    post auth_login_url + "?api_key=" + 'foo'
    assert_response :unauthorized
  end

  test "should post logout" do
    ENV["API_KEY"] = "local1"

    post auth_logout_url + "?api_key=" + ENV["API_KEY"]

    assert_response :success
  end

  test "should post oauth" do
    ENV["API_KEY"] = "local"

    post auth_oauth_url + "?api_key=" + ENV["API_KEY"]

    assert_response :success
  end
end
