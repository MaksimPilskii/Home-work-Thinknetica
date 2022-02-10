class CargoWagon < Wagon
  attr_reader :type, :number

  def initialize(number)
    @number = number
    @type = "Cargo"
    super
  end
end