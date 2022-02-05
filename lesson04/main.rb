require './interface'
require './train'
require './route'
require './station'
require './cargo_train'
require './passenger_train'
require './wagon'
require './wagon_cargo'
require './wagon_passenger'

interface = Interface.new
choice = ''

while choice != "0" 
  interface.menu_begin

  choice = gets.chomp

case choice
when "1"
  interface.menu_stations
when "2"
  interface.menu_trains
when "3"
  interface.menu_route
end
end 
