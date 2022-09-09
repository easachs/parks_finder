class ParksService
  def self.parks_in(state)
    response = conn.get("/api/v1/parks?stateCode=#{state}")
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(url: 'https://developer.nps.gov') do |faraday|
      faraday.params['api_key'] = ENV.fetch('nps_api_key', nil)
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end