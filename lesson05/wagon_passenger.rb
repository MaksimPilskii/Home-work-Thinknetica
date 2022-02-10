class PassengerWagon < Wagon
  attr_reader :type, :number

  def initialize(number)
    @number = number 
    @type = "Passenger"
    super
  end
end