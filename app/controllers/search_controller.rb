class SearchController < ApplicationController

  def index
    zip = params[:q]
    @stations_by_zip = NrelService.new(zip)
  end

end