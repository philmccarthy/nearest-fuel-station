require 'rails_helper'

RSpec.describe 'search page', type: :feature do
  describe '' do
    it 'it can search for nearest charging station to option from dropdown menu' do
      visit '/'
      
      select 'Turing', from: :location
      click_button 'Find Nearest Station'

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Nearest Charging Station')

      expect(page).to have_content('Station Name: skfjh')
      expect(page).to have_content('Address: asdasd')
      expect(page).to have_content('Fuel Type: air')
      expect(page).to have_content('Distance Away: 0.1 miles')
      expect(page).to have_content('Travel Time: 1 min')

      expect(page).to have_css('.directions')
      within('.direction') do
        expect(page).to have_content('Turn left onto Lawrence St Destination will be on the left')
      end
    end
  end
end
