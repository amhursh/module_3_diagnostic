class NrelService

  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/") do |f|
      # f.headers["api_key"] = ENV["api_key"]
      f.adapter Faraday.default_adapter
    end
  end

  def get_stations
    response = conn.get do |req|
      req.url '/nearest.json'
      req.params['api_key'] = ENV["api_key"]
      req.params['location'] = zip
    end
    binding.pry
  end

  private

    attr_reader :zip,
                :conn

end