# frozen_string_literal: true
require './modules'
require './validation'
require './accessors'

class Station
  include Validation
  include CompanyName
  include InstanceCounter
  include Validation
  extend Accessors
  
  attr_accessor_with_history :trains
  attr_reader :name

  validate :number, :presence
  validate :number, :format, /^[a-z]{3}-\d{2}$/i

  def self.all
    @all ||= []
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    count_instances
    self.class.all << self
  end

  def arrival_trains(train)
    @trains << train
  end

  def departure_train(train)
    @trains.delete(train)
  end

  def number_trains
    @trains.length
  end

  def trains_type(type)
    @trains.count(type)
  end

  def each_train(block)
    @trains.each { |train| block.call(train) }
  end
end
