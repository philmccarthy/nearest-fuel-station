class SearchFacade
  class << self
    def get_nearest_station(params)
      FuelStation.new(FuelStationService.call_nearest_station(params))
    end
  end
end
