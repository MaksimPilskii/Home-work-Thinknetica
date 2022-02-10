require './modules'

class Wagon
  include CompanyName
  include InstanceCounter
  attr_reader :number

  def initialize(number)
    @number_wagon = number
    counting_instances
  end
end