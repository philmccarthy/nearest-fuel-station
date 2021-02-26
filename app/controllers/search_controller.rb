class SearchController < ApplicationController
  def index
    @nearest_station = SearchFacade.get_nearest_station(params)
    @route = SearchFacade.get_directions(params[:location], @nearest_station.lat_long)
  end
end
