require 'rails_helper'

RSpec.describe 'viewing party homepage' do
  let!(:user_1) { User.create!(name: 'Alfred', email: 'alfred@butler.net', status: 0, password: 'mastermind123', password_confirmation: 'mastermind123') }
  let!(:user_2) { User.create!(name: 'Bruce', email: 'bruced@boss.net', status: 0, password: 'batcave123', password_confirmation: 'batcave123') }
  let!(:user_3) { User.create!(name: 'Oswald', email: 'oswald@cobblepot.gotham', status: 0, password: 'penguin123', password_confirmation: 'penguin123') }

  before :each do
    visit user_discover_index_path(user_1)
  end

  it 'has a discover movies header', :vcr do
    expect(page).to have_content('Discover Movies')
  end

  it 'has a button to find top rated movies', :vcr do
    expect(page).to have_button('Find Top Rated Movies')

    click_button 'Find Top Rated Movies'

    expect(current_path).to eq(user_movie_index_path(user_1))
  end

  describe 'form to find movies' do
    it 'has a button to find movies', :vcr do
      expect(page).to have_button('Find Movies')

      fill_in :keyword, with: 'Godfather'
      click_button 'Find Movies'

      expect(current_path).to eq(user_movie_index_path(user_1))
    end
  end
end
