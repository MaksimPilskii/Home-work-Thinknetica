class Train
  attr_accessor :number, :speed, :route, :station, :trains, :wagons_trains
  attr_reader :current_station

  def initialize(number)
    @number = number
    @wagons_trains = []
    @speed = 0
  end

  def acceleration(speed)
    @speed += speed
  end

  def current_speed
    @speed
  end

  def stop_train
    @speed = 0
  end

  def attach_wagon(wagon)
    @wagons_trains << wagon.number_wagon if @type == wagon.type_wagon
  end

  def remove_wagon(number_wagon)
    @wagons_trains.delete(number_wagon)
  end

  def get_station(route)
    @route = route
    @current_station = route.first_station
  end

  def move_to_next_station
    @current_station = next_station if next_station
  end

  def move_to_previous_station
    @current_station = previous_station if previous_station
  end

  def station_index
    @route.whole_route.index(@current_station)
  end

private
#в клиентской части программы нет обращения к этим методам

  def next_station
    @route.whole_route[station_index + 1] if @current_station != route.last_station
  end

  def previous_station
    @route.whole_route[station_index - 1] if @current_station != route.first_station
  end
end