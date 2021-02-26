class FuelStation
  attr_reader :name, :street, :city, :state, :zip, :fuel_type,
              :access_times, :distance_away, :lat_long
  def initialize(data)
    @search_location = data
    @name = data[:station_name]
    @street = data[:street_address]
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
    @fuel_type = data[:fuel_type_code]
    @access_times = data[:access_days_time]
    @distance_away = data[:distance]
    @lat_long = "#{data[:latitude]},#{data[:longitude]}"
  end
end
