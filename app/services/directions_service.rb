class DirectionsService
  class << self
    def call_for_directions(from, to)
      response = conn.get("directions/v2/route") do |request|
        request.params[:key] = ENV['MAPQUEST_API_KEY']
        request.params[:from] = from
        request.params[:to] = to
      end
      parse(response)[:route]
    end

    private

    def conn
      Faraday.new("http://www.mapquestapi.com/") do |conn|
        
      end
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end