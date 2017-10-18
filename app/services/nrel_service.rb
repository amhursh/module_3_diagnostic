class NrelService

  def initialize(zip)
    conn = Faraday.new(url: "/api/alt-fuel-stations/v1/") do
      faraday.headers["api_key"] = 
    end
  end

end