class PassengerWagon < Wagon
  attr_accessor :passenger_seats
  attr_reader :type, :number

  def initialize(number, passenger_seats)
    @passenger_seats = passenger_seats
    super(number)
    @type = 'Passenger'
  end

  def take_a_seat
    occupied_places
    @number_of_occupied_places += 1
  end

  def occupied_places
    @number_of_occupied_places ||= 0
    @number_of_occupied_places
  end

  def available_seats
    occupied_places
    @passenger_seats - @number_of_occupied_places
  end
end
