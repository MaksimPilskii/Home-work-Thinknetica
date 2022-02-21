# frozen_string_literal: true

class CargoWagon < Wagon
  attr_reader :type, :number, :total_volume

  def initialize(number, total_volume)
    @total_volume = total_volume
    super(number)
    @type = 'Cargo'
  end

  def occupy_volume(volume)
    get_the_occupied_volume
    @occupied_volume += volume
  end

  def the_occupied_volume
    @occupied_volume ||= 0
    @occupied_volume
  end

  def free_volume
    get_the_occupied_volume
    @total_volume - @occupied_volume
  end
end
