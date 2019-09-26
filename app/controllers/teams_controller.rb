class TeamsController < ApplicationController
  def new
    team = Team.new(team_params)

    return return_success(team) if team.save
    return_failure('Failed to save team for: ' + JSON.generate(team.errors.messages))
  end

  private
  def team_params
    params.require(:teamName)
    params.require(:homeLocation)
    params.require(:captainId)
    params.permit(:teamName, :homeLocation, :captainId)
  end
end
