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

  def number_type_trains
    puts "Пассажирских поездов: #{@trains.select { |type| type = "passenger"}.length}" 
    puts "Грузовых поездов: #{@trains.select { |type| type = "cargo"}.length}"
  end

end
