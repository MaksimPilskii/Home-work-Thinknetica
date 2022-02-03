class CargoWagon
  attr_reader :type_wagon, :number_wagon

  def initialize(number)
    @number_wagon = number
    @type_wagon = "Cargo"
  end
end