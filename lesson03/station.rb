class Station
  attr_accessor :trains
  
  def initialize(name)
    @name = name
    @trains = []
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
end
