class FuelStationService
  class << self
    def call_nearest_station(params)
      response = conn.get("alt-fuel-stations/v1/nearest.json") do |request|
        request.params[:api_key] = ENV['NREL_API_KEY']
        request.params[:location] = params[:location]
      end
      parse(response)[:fuel_stations][0]
    end

    private

    def conn
      Faraday.new("https://developer.nrel.gov/api/")
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
