require './station'
require './route'

class Train
  attr_accessor :number, :type, :number_wagon, :speed, :route, :station, :trains 
  attr_reader :current_station

  def initialize(number, type, number_wagons)
    @number = number
    @type = type
    @number_wagon = number_wagons
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

  def wagons
    @number_wagon
  end

  def attach_wagon
    @number_wagon += 1 if @speed == 0
  end

  def remove_wagon
    @number_wagon -= 1 if @speed == 0
  end

  def get_station(route)
    @route = route
    @current_station = route.first_station
  end

  def move_to_next_station
    @current_station = @route.whole_route[station_index + 1] if @current_station != route.last_station
  end

  def move_to_previous_station
    @current_station = @route.whole_route[station_index - 1] if @current_station != route.first_station
  end

  def station_index
    @route.whole_route.index(@current_station)
  end

  def next_station
    @route.whole_route[station_index + 1]
  end

  def previous_station
    @route.whole_route[station_index - 1]
  end
end
