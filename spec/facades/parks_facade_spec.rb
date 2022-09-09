require 'rails_helper'

RSpec.describe 'ParksFacade' do
  it 'returns instances of parks in a state', vcr: 'tn_parks' do
    parks = ParksFacade.parks_in("TN")
    expect(parks).to be_a(Array)
    expect(parks.first).to be_a(Park)
    expect(parks.first.full_name).to be_a(String)
  end
end