class Station

  attr_reader :name,
              :street,
              :city,
              :state,
              :zip,
              :fuel_type,
              :distance,
              :access_times

  def initialize(input)
    @name = input[:station_name]
    @street = input[:street_address]
    @city = input[:city]
    @state = input[:state]
    @zip = input[:zip]
    @fuel_type = input[:fuel_type_code]
    @distance = input[:distance]
    @access_times = input[:access_days_time]
  end

  def address
    street + " " + city + " " + state + " " + zip
  end

end