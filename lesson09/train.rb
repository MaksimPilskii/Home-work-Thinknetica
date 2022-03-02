# frozen_string_literal: true

require './modules'
require './validation'
require './accessors'

class Train
  include Validation
  include CompanyName
  include InstanceCounter
  include Validation
  extend Accessors
  
  attr_accessor_with_history :number, :speed, :route, :station, :trains, :wagons_trains, :wagons, :type
  attr_reader :current_station

  validate :number, :presence
  validate :number, :format, /^[a-z]{3}-\d{2}$/i

  def self.all
    @@all_trains ||= []
  end


  def self.find(number)
    @@all_trains.select { |train| train.number == number }
  end

  def initialize(number)
    @number = number
    @wagons_trains = []
    @speed = 0
    validate!
    self.class.all << self
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
    @wagons_trains << wagon if @type == wagon.type
  end

  def remove_wagon(wagon_selection)
    @wagons_trains.delete_at(wagon_selection)
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

  def each_wagon(block)
    @wagons_trains.each { |wagon| block.call(wagon) }
  end

  private

  def next_station
    @route.whole_route[station_index + 1] if @current_station != route.last_station
  end

  def previous_station
    @route.whole_route[station_index - 1] if @current_station != route.first_station
  end

  def add_wagon_to_train(train_selection, wagon_selection)
    @trains[train_selection].attach_wagon(@wagons[wagon_selection])
  end
end
