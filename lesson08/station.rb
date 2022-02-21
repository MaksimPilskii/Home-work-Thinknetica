# frozen_string_literal: true

class Station
  include InstanceCounter
  attr_accessor :trains
  attr_reader :name

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

  def validate!
    raise 'The string cannot be empty' if name.empty?
    raise 'Only letters are allowed in the name' if name !~ /^[а-я]{1,}$/i
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
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
