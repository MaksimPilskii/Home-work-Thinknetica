class PassengerTrain < Train
  attr_accessor :passenger_seats
  
  def initialize(number)
    super
    @type = "Passenger"
  end

end