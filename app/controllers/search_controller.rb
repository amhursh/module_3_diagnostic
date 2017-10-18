class SearchController < ApplicationController

  def index
    zip = params[:q]
    station_search = NrelService.get_stations(zip)
    @stations_by_zip = station_search.map do |station|
      Station.new(station)
    end
  end

end