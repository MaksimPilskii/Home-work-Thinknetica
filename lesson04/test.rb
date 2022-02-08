require './interface'
require './train'
require './route'
require './station'
require './cargo_train'
require './passenger_train'
require './wagon'
require './wagon_cargo'
require './wagon_passenger'

stations = []
trains = []
wagons = []
routes = []

station = Station.new("Krasnoyars")
stations << station
station2 = Station.new("Achinsk")
stations << station2

#p stations

train = Train.new("Era1")
trains << train
train1 = Train.new("Ruka2")
trains << train1

#p trains

wagon = PassengerWagon.new("123")
wagons << wagon
wagon2 = PassengerWagon.new("12334")
wagons << wagon2

#p wagons

route = Route.new("Kras", "Ach")
routes << route
route2 = Route.new("Moscow", "Sochi")
routes << route2
#trains.get_station(route)
train.get_station(route)
train1.get_station(route2)

p trains
#p train

p routes 
puts

route.add_intermediate_station("Kirov")

trains.each.with_index(1) do |item, index|
  

  print "#{index}. Поезд #{item.route.whole_route.join('-')}"
  puts

end 

  
 # trains.map do |item| 
  #  trains_with_route << item unless item.route.whole_route = nil?
#end


#puts trains.route.whole_route

#trains.each.with_index(1) do |train, index|
 # puts "#{index}. поезд с номером #{train.number}"
#end

#puts "Выбирете поезд, который прибыл на станцию"

#choice_train = gets.to_i - 1

#stations[1].trains << trains[choice_train]
#p stations

wagons.delete(1)

#p wagons