require 'rails_helper'

RSpec.describe "the Competition show page" do
  before(:each) do
    @competition = Competition.create!(name: "Winter Jam", location: "White Sands", sport: "Surfing")

    @team1 = @competition.teams.create!(hometown: "Kailua", nickname: "The Sea Turtles")
    @team2 = @competition.teams.create!(hometown: "Waimanalo", nickname: "The Tiger Sharks")
    @team3 = @competition.teams.create!(hometown: "Haleiwa", nickname: "Spinner Dolphins")
    @team4 = Team.create!(hometown: "Honolulu", nickname: "Hammerheads")

    @player1 = @team1.players.create!(name: "Ikaika Smith", age: 15)
    @player2 = @team2.players.create!(name: "Lilly Tanaka", age: 16)
    @player3 = @team2.players.create!(name: "Robert Balastrado", age: 16)
    @player4 = @team3.players.create!(name: "Teruo Hamachi", age: 9)

    visit competition_path(@competition)
  end

  it 'shows competition details, teams competing' do
    expect(page).to have_content(@competition.name)
    expect(page).to have_content(@competition.location)
    expect(page).to have_content(@competition.sport)
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team2.hometown)
    expect(page).to have_content(@team3.nickname)
    expect(page).to have_content(@team3.hometown)
  end

  xit 'shows average player age' do
  end

  it 'has form to add team to competition' do
    expect(page).to have_content('Add Team to Competition:')
    expect(page).to have_button('Submit')

    fill_in "nickname", with: "Hammerheads"
    click_button "Submit"

    expect(current_path).to eq(competition_path(@competition))
    expect(page).to have_content("Hammerheads")
  end
end
