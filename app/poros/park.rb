class Park
  attr_reader :full_name, :description, :direction_info, :operation_hrs
  def initialize(data)
    @full_name = data[:fullName]
    @description = data[:description]
    @direction_info = data[:directionsInfo]
    @operation_hrs = data[:operatingHours].first[:standardHours].map {|k,v| "#{k.capitalize}: #{v}" } if data[:operatingHours].first
  end
end