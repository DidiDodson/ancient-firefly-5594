class CompetitionTeamsController < ApplicationController
  def create
    competition = Competition.find(params[:id])

    team = Team.find_by_nickname(params[:nickname])
    competition_team = CompetitionTeam.create(competition: competition, team: team)

    redirect_to "/competitions/#{params[:id]}"
  end
end
