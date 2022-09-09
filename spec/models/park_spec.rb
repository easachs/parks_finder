require 'rails_helper'

RSpec.describe Park do
  before :each do
    @data = {fullName: 'White River', description: 'pretty', directionsInfo: 'head west', operatingHours: [{standardHours: {monday: "always", tuesday: "sometimes"}}]}
    @park = Park.new(@data)
  end

  it 'exists' do
    expect(@park).to be_a(Park)
  end

  it 'has attributes' do
    expect(@park.full_name).to eq('White River')
    expect(@park.description).to eq('pretty')
    expect(@park.direction_info).to eq('head west')
    expect(@park.operation_hrs.first).to eq('Monday: always')
    expect(@park.operation_hrs.last).to eq('Tuesday: sometimes')
  end
end