require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:competition_teams) }
    it { should have_many(:competitions).through(:competition_teams) }
  end

  it 'sorts teams by player average age' do
    @competition = Competition.create!(name: "Winter Jam", location: "White Sands", sport: "Surfing")

    @team1 = @competition.teams.create!(hometown: "Kailua", nickname: "The Sea Turtles")
    @team2 = @competition.teams.create!(hometown: "Waimanalo", nickname: "The Tiger Sharks")
    @team3 = @competition.teams.create!(hometown: "Haleiwa", nickname: "Spinner Dolphins")

    @player1 = @team1.players.create!(name: "Ikaika Smith", age: 15)
    @player2 = @team2.players.create!(name: "Lilly Tanaka", age: 16)
    @player3 = @team2.players.create!(name: "Robert Balastrado", age: 16)
    @player4 = @team3.players.create!(name: "Teruo Hamachi", age: 9)

    expect(Team.sort_by_player_age). to eq([@team2, @team1, @team3])
  end
end
