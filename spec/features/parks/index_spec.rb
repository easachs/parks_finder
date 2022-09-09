require 'rails_helper'

RSpec.describe 'Parks Index' do
  it 'error with no search', vcr: 'error' do
    visit parks_path

    expect(page).to_not have_content('result for parks in')
    expect(page).to_not have_content('Description:')
    expect(page).to_not have_content('Directions:')
    expect(page).to_not have_content('Hours:')
    expect(page).to have_content('Error')
    expect(page).to have_content('Please select a state.')
  end

  it 'displays parks for TN', vcr: 'tn_parks' do
    visit root_path

    select 'Tennessee', from: 'state'
    click_button 'Find Parks'

    expect(page).to have_content('15 results for parks in TN')
    expect(page).to have_content('Andrew Johnson National Historic Site')
    expect(page).to have_content('Description:')
    expect(page).to have_content("Andrew Johnson's complex presidency")
    expect(page).to have_content('Directions:')
    expect(page).to have_content('The GPS setting for Andrew Johnson NHS')
    expect(page).to have_content('Hours:')
    expect(page).to have_content('Monday: 9:00AM - 4:00PM')
  end
end