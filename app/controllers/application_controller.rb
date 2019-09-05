class ApplicationController < ActionController::API
  include Responses

  before_action -> {
    return true if authorize params

    return_not_authorized("Given API key did not match a valid key")
  }

  private
  def authorize (params)
    params.permit(:api_key)

    # This key is temporarily stored in the ENV instead of the DB
    (params.has_key? :api_key) && (params[:api_key] === ENV["API_KEY"])
  end
end