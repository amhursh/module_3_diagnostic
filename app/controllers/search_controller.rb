class SearchController < ApplicationController

  def index
    zip = params[:q]
    @stations_by_zip = NrelService.get_stations(zip)
  end

end