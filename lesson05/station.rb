class Station
  include InstanceCounter
  attr_accessor :trains
  attr_reader :name
  
  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
    count_instances
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

  def self.all
    @all_station ||= []
  end
end
