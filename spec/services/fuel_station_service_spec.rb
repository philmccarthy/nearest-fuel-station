require 'rails_helper'

RSpec.describe FuelStationService do
  describe 'class methods' do
    it '::call_nearest_station' do
      params = {location: '1331 17th St LL100, Denver, CO 80202'}
      search = FuelStationService.call_nearest_station(params)

      expect(search).to be_a Hash
      expect(search).to have_key :station_name
      expect(search).to have_key :street_address
      expect(search).to have_key :city
      expect(search).to have_key :state
      expect(search).to have_key :zip
      expect(search).to have_key :fuel_type_code
      expect(search).to have_key :access_days_time
      expect(search).to have_key :distance
      expect(search).to have_key :latitude
      expect(search).to have_key :longitude

      # Ran out of time during refactor, should also check for data types
    end
  end
end
