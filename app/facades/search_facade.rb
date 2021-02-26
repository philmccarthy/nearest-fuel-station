class SearchFacade
  class << self
    def get_nearest_station(params)
      FuelStation.new(FuelStationService.call_nearest_station(params))
    end

    def get_directions(from, to)
      Route.new(DirectionsService.call_for_directions(from, to))
    end
  end
end
