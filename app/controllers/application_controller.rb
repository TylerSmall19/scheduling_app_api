class ApplicationController < ActionController::API
  include Responses

  before_action -> {
    # return true if authorize request is successful
    (authorize request) || return_not_authorized("Given API key did not match a valid key")
  }

  private
  def authorize (request)
    # This key is temporarily stored in the ENV instead of the DB
    request.headers["HTTP_API_KEY"] && (request.headers["HTTP_API_KEY"] === ENV["API_KEY"])
  end
end