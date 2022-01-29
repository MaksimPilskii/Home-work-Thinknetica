class Route
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = []
  end

  def add_station(station)
    @intermediate_stations << station
  end

  def delete_station(station)
    @intermediate_stations.delete(station) if @intermediate_stations.include?(station)
  end

  def whole_route
    [@first_station, *@intermediate_stations, @last_station]
  end
end
