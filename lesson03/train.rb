require './station'
require './route'

class Train
  attr_accessor :number, :type, :number_wagon, :speed, :route

  def initialize(number, type, number_wagons)
    @number = number
    @type = type
    @number_wagon = number_wagons
    @speed = speed
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

  def get_station
    @current_station = route.first_station
  end

  def next_station
    @current_station = @route.whole_route[index_station + 1] if @current_station != route.last_station
  end

  def previous_station
    @current_station = @route.whole_route[index_station - 1] if @current_station != route.first_station
  end

  def index_station
    @route.whole_route.index(@current_station)
  end

  def show_station
    @current_station
  end

  def show_next_station
    @route.whole_route[index_station + 1] if @current_station != route.last_station
  end

  def show_previous_station
    @route.whole_route[index_station - 1] if @current_station != route.first_station
  end
end
