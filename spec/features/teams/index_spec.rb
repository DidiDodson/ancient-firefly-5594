require 'rails_helper'

RSpec.describe "the Teams index page" do
  before(:each) do
    @team1 = Team.create!(hometown: "Kailua", nickname: "The Sea Turtles")
    @team2 = Team.create!(hometown: "Waimanalo", nickname: "The Tiger Sharks")
    @team3 = Team.create!(hometown: "Haleiwa", nickname: "Spinner Dolphins")

    @player1 = @team1.players.create!(name: "Ikaika Smith", age: 15)
    @player2 = @team2.players.create!(name: "Lilly Tanaka", age: 16)
    @player3 = @team2.players.create!(name: "Robert Balastrado", age: 16)
    @player4 = @team3.players.create!(name: "Teruo Hamachi", age: 9)

    visit teams_path
  end

  it 'shows all teams name and hometown' do
    within("#team") do
      within("#team-#{@team1.id}") do
        expect(page).to have_content(@team1.nickname)
        expect(page).to have_content(@team1.hometown)
      end

      within("#team-#{@team2.id}") do
        expect(page).to have_content(@team2.nickname)
        expect(page).to have_content(@team2.hometown)
      end

      within("#team-#{@team3.id}") do
        expect(page).to have_content(@team3.nickname)
        expect(page).to have_content(@team3.hometown)
      end
    end



  end

  it 'shows the names and ages of all team players' do
    within("#team") do
      within("#team-#{@team1.id}") do
        expect(page).to have_content(@player1.name)
        expect(page).to have_content(@player1.age)
      end

      within("#team-#{@team2.id}") do
        expect(page).to have_content(@player2.name)
        expect(page).to have_content(@player2.age)
        expect(page).to have_content(@player3.name)
        expect(page).to have_content(@player3.age)
      end

      within("#team-#{@team3.id}") do
        expect(page).to have_content(@player4.name)
        expect(page).to have_content(@player4.age)
        expect(page).to_not have_content(@player3.name)
      end
    end
  end
end
