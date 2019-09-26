require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    ENV["API_KEY"] = "local"

    post teams_url, headers: { HTTP_API_KEY: ENV["API_KEY"] }, params: { teamName: 'Test1', homeLocation: 'Test location' }
    assert_response :success
  end

  test "should return the created team" do
    ENV["API_KEY"] = "local"

    post teams_url, headers: { HTTP_API_KEY: ENV['API_KEY'] }, params: { teamName: 'Test1', homeLocation: 'Test location' }

    parsed_body = JSON.parse(@response.body)

    assert_equal parsed_body['teamName'], 'Test1'
    assert_equal parsed_body['homeLocation'], 'Test location'
    refute_nil parsed_body[:id]
  end
end
