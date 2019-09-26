class TeamsController < ApplicationController
  def new
    return_success(team_params)
  end

  private
  def team_params
    params.require(:teamName)
    params.require(:homeLocation)
    params.permit(:teamName, :homeLocation)
  end
end
