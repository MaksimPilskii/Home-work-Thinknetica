# frozen_string_literal: true

require './modules'
require './validation'
require './accessors'

class Wagon
  include CompanyName
  include InstanceCounter
  include Validation
  extend Accessors

  attr_reader :number

  validate :number, :presence
  validate :number, :format, /^[a-z]{3}-\d{2}$/i

  def initialize(number)
    @number = number
    validate!
    count_instances
  end
end
