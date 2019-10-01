class TeamsController < ApplicationController
  def create
    team = Team.new(new_team_params)

    return return_success(team) if team.save
    return_failure('Failed to save team for: ' + JSON.generate(team.errors.messages))
  end

  def show
    params.permit(:team_id)

    team = Team.find params[:team_id]

    if team
      return_success(team)
    else
      return_failure('Something went wrong when looking for ID: ' + params[:team_id])
    end
  end

  private
  def new_team_params
    params.require(:teamName)
    params.require(:homeLocation)
    params.require(:captainId)
    params.permit(:teamName, :homeLocation, :captainId)
  end
end
