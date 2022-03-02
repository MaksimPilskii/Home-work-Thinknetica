# frozen_string_literal: true
require './modules'
require './validation'
require './accessors'

class Route
  include InstanceCounter
  include CompanyName
  include InstanceCounter
  include Validation
  extend Accessors
  
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = []
    validate!
    count_instances
  end

  def add_intermediate_station(station)
    validate!

    @intermediate_stations << station unless whole_route.include?(station)
  end

  def delete_station(station)
    @intermediate_stations.delete(station)
  end

  def whole_route
    [@first_station, *@intermediate_stations, @last_station]
  end
end
