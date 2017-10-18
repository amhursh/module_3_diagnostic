require 'rails_helper'

feature "User can search stations" do
  scenario "user enters zip code and can see associated stations" do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203
    fill_in 'search', with: '80203'
    # And I click "Locate"
    click_on 'Locate'
    # Then I should be on page "/search" with parameters visible in the url
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_content "10 closest stations"
    # And the stations should be limited to Electric and Propane
    expect(page).to have_css ".station", count: 10
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within(first(".station")) do
      expect(page).to have_css ".station_name"
      expect(page).to have_css ".station_address"
      expect(page).to have_css ".station_fuel_types"
      expect(page).to have_css ".station_distance"
      expect(page).to have_css ".station_access_times"
    end
  end
end
