class Station
  attr_accessor :trains
  attr_reader :name
  
  def initialize(name)
    @name = name
    @trains = []
    @all_station = []
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
