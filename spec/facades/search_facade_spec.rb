require 'rails_helper'

RSpec.describe SearchFacade do
  describe 'class methods' do
    it '::get_nearest_station' do
      params = {location: '1331 17th St LL100, Denver, CO 80202'}
      station = SearchFacade.get_nearest_station(params)
      
      expect(station).to be_a FuelStation
      expect(station).to have_attributes(
        access_times: "MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified",
        city: "Denver",
        distance_away: 0.0934,
        fuel_type: "ELEC",
        lat_long: "39.7501605,-104.9951224",
        name: "Seventeenth Street Plaza",
        state: "CO",
        street: "1225 17th St.",
        zip: "80202"
      )
    end
  end
end
