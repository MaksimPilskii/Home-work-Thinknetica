class Route
  include InstanceCounter
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = []
    validate!
    count_instances
  end

  def validate!
    raise 'The string cannot be empty' if first_station.empty? || last_station.empty?
    raise 'Only letters are allowed in the name' if first_station !~ /^[а-я]{1,}$/i || last_station !~ /^[а-я]{1,}$/i
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def add_intermediate_station(station)
    raise 'The string cannot be empty' if station.empty?
    raise 'Only letters are allowed in the name' if station !~ /^[а-я]{1,}$/i

    @intermediate_stations << station unless whole_route.include?(station)
  end

  def delete_station(station)
    @intermediate_stations.delete(station)
  end

  def whole_route
    [@first_station, *@intermediate_stations, @last_station]
  end
end
