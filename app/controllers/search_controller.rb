class SearchController < ApplicationController
  def index
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_API_KEY']}&location=#{params[:location]}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    @nearest_station = FuelStation.new(parsed_response[:fuel_stations][0])

    response = Faraday.get("http://www.mapquestapi.com/directions/v2/route?key=#{ENV['MAPQUEST_API_KEY']}&from=#{params[:location]}&to=#{@nearest_station.lat_long}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    @route = Route.new(parsed_response[:route])
  end
end
