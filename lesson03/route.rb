class Route
  attr_accessor :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = []
  end

  def add_station(station)
    @intermediate_stations << station
  end

  def delete_station(station)
    @intermediate_stations.delete(station)
  end

  def whole_route
    whole_route = [@first_station] + @intermediate_stations + [@last_station]
    whole_route
  end

  
end
