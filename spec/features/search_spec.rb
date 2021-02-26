require 'rails_helper'

RSpec.describe 'search page', type: :feature do
  describe '' do
    it 'it can search for nearest charging station to option from dropdown menu' do
      visit '/'
      
      select 'Turing', from: :location
      click_button 'Find Nearest Station'

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Nearest Charging Station')

      expect(page).to have_content('Station Name: Seventeenth Street Plaza')
      expect(page).to have_content('Address: 1225 17th St., Denver, CO 80202')
      expect(page).to have_content('Fuel Type: ELEC')
      expect(page).to have_content('Access Times: MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified')
      expect(page).to have_content('Distance Away: 0.1 miles')

      expect(page).to have_css('.directions')
      within('.directions') do
        expect(page).to have_content('Travel Time: 1 min')
        expect(page).to have_content("Start out going southeast on 17th St toward Larimer St/CO-33.")
        expect(page).to have_content("Turn left onto Lawrence St/CO-33.")
        expect(page).to have_content("1737 LAWRENCE ST is on the left.")
      end
    end
  end
end
