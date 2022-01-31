class Route
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = []
  end

  def add_station(station)
    @intermediate_stations << station unless @intermediate_stations.include?(station)
  end

  def delete_station(station)
    @intermediate_stations.delete(station) 
  end

  def whole_route
    [@first_station, *@intermediate_stations, @last_station]
  end
end

route = Route.new('Ква', 'Не ква')
p route

route.add_station('Ква')
route.add_station('Ква')
p route