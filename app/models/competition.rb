class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams

  def av_age

    team_av = teams.map do |team|
        team.players.average(:age) 
    end
    sum = team_av.sum
    comp_average = sum / team_av.count
    comp_average.to_f.round(1)
  end
end
