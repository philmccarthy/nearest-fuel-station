class SearchController < ApplicationController
  def index
    response = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=vdPxCPcSYAptLGyjadG6emqTb5ZAEyRWUdRCMVIr&latitude=39.7508006&longitude=-104.9965947')
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    @nearest_station = FuelStation.new(parsed_response[:fuel_stations][0])
    require 'pry'; binding.pry
  end
end