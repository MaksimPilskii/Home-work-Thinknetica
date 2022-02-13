require './modules'

class Wagon
  include CompanyName
  include InstanceCounter
  attr_reader :number

  def initialize(number)
    @number_wagon = number
    validate!
    count_instances
  end

  def validate!
    raise "The string cannot be empty" if number.empty?
    raise "Number has invalid format" if number !~/^[а-я]{3}[-]\d{2}$/i
  end

  def valid?
    validate!
    true
  rescue
    false
  end
end