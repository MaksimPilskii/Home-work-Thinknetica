# frozen_string_literal: true

class CargoTrain < Train
  
  validate :number, :presence
  validate :number, :format, /^[a-z]{3}-\d{2}$/i
  
  def initialize(number)
    super
    @type = 'Cargo'
  end
end
