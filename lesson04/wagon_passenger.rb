class PassengerWagon
  attr_reader :type_wagon, :number_wagon

  def initialize(number)
    @number_wagon = number
    @type_wagon = "Passenger"
  end
end