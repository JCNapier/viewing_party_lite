require 'rails_helper'

RSpec.describe 'viewing party homepage' do
  let!(:user_1) { User.create!(name: 'Alfred', email: 'alfred@butler.net', status: 0, password: 'mastermind123', password_confirmation: 'mastermind123') }
  let!(:user_2) { User.create!(name: 'Bruce', email: 'bruced@boss.net', status: 0, password: 'batcave123', password_confirmation: 'batcave123') }
  let!(:user_3) { User.create!(name: 'Oswald', email: 'oswald@cobblepot.gotham', status: 0, password: 'penguin123', password_confirmation: 'penguin123') }

  it 'should display the users name at the top of the page', :vcr do
    visit user_path(user_1)

    expect(page).to have_content(user_1.name)
  end

  it 'can click a button to discover movies', :vcr do
    visit user_path(user_1)

    click_button 'Discover Movies'

    expect(current_path).to eq(user_discover_index_path(user_1))
  end

  it 'has a viewing parties section', :vcr do
    visit user_path(user_1)

    expect(page).to have_content('Viewing Parties')
  end
end
