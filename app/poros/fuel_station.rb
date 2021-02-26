class FuelStation
  def initialize(data)
    @name = data[:station_name]
    @street_address = data[:street_address]
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
    @fuel_type = data[:fuel_type_code]
    @access_times = data[:access_days_time]
    @distance_away = data[:distance]
    @latitude = data[:latitude]
    @longitude = data[:longitude]
  end
end
