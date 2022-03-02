# frozen_string_literal: true

class CargoWagon < Wagon
  attr_accessor_with_history :total_volume
  attr_reader :type, :number

  validate :number, :presence
  validate :number, :format, /^[a-z]{3}-\d{2}$/i

  def initialize(number, total_volume)
    @total_volume = total_volume
    super(number)
    @type = 'Cargo'
  end

  def occupy_volume(volume)
    the_occupied_volume
    @occupied_volume += volume
  end

  def the_occupied_volume
    @occupied_volume ||= 0
    @occupied_volume
  end

  def free_volume
    the_occupied_volume
    @total_volume - @occupied_volume
  end
end
