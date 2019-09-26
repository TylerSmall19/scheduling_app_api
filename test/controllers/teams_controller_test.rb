require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    ENV["API_KEY"] = "local"

    post teams_url, headers: { HTTP_API_KEY: ENV["API_KEY"] }, params: { teamName: 'Test1', homeLocation: 'Test location', captainId: 'testId' }
    assert_response :success
  end

  test "should return the created team" do
    ENV["API_KEY"] = "local"

    post teams_url, headers: { HTTP_API_KEY: ENV['API_KEY'] }, params: { teamName: 'Test1', homeLocation: 'Test location', captainId: 'testId' }

    parsed_body = JSON.parse(@response.body)

    assert_equal 'Test1', parsed_body['teamName']
    assert_equal 'Test location', parsed_body['homeLocation']
  end

  test "should persist the created team" do
    ENV["API_KEY"] = "local"

    post teams_url, headers: { HTTP_API_KEY: ENV['API_KEY'] }, params: { teamName: 'Test1', homeLocation: 'Test location', captainId: 'testId' }

    parsed_body = JSON.parse(@response.body)

    refute_nil parsed_body['id']
  end
end
