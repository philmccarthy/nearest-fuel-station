class SearchController < ApplicationController
  def index
    @nearest_station = SearchFacade.get_nearest_station(params)

    response = Faraday.get("http://www.mapquestapi.com/directions/v2/route?key=#{ENV['MAPQUEST_API_KEY']}&from=#{params[:location]}&to=#{@nearest_station.lat_long}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    @route = Route.new(parsed_response[:route])
  end
end
