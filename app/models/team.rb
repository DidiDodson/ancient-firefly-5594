class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  def self.sort_by_player_age
    self.joins(:players)
         .select('teams.*, avg(players.age) as av_age')
         .group('teams.id')
         .order('av_age desc')
  end
end
