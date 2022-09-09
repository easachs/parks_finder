class ParksFacade
  def self.parks_in(state)
    ParksService.parks_in(state)[:data].map do |park_data|
      Park.new(park_data)
    end
  end

  def self.total_in(state)
    ParksService.parks_in(state)[:total]
  end
end