class NrelService

  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_stations
    # response = conn.get do |req|
    #   req.url '/nearest.json'
    #   req.params['api_key'] = ENV["api_key"]
    #   req.params['location'] = zip
    # end
    response = conn.get("nearest.json?api_key=#{ENV['api_key']}&location=#{zip}")
    search_results = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def self.get_stations(zip)
    new(zip).get_stations
  end

  private

    attr_reader :zip,
                :conn

end