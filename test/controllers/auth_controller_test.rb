require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should return success when valid key is given" do
    ENV["API_KEY"] = "local"

    post auth_login_url, :params => { auth: { userName: "test", password: "localTest" } }, headers: { HTTP_API_KEY: ENV["API_KEY"] }

    assert_response :success
  end

  test "should give unauthorized when no key is given" do
    ENV["API_KEY"] = "local"

    post auth_login_url
    assert_response :unauthorized
  end

  test "should give unauthorized when non-matching key is given" do
    ENV["API_KEY"] = "local"

    post auth_login_url, headers: { HTTP_API_KEY: 'th' }
    assert_response :unauthorized
  end

  test "should post logout" do
    ENV["API_KEY"] = "local1"

    post auth_logout_url, headers: { HTTP_API_KEY: ENV["API_KEY"] }

    assert_response :success
  end

  test "should post oauth" do
    ENV["API_KEY"] = "local"

    post auth_oauth_url, headers: { HTTP_API_KEY: ENV["API_KEY"] }

    assert_response :success
  end
end
