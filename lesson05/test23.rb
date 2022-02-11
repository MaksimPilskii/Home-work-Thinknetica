require './interface'
require './train'
require './route'
require './station'
require './cargo_train'
require './passenger_train'
require './wagon'
require './wagon_cargo'
require './wagon_passenger'
require './modules'

Station.instances


stations = []
trains = []
wagons = []
routes = []



p Station.instances

station = Station.new("Krasnoyars")
p Station.instances
stations << station
station2 = Station.new("Achinsk")
stations << station2

puts Station.all

train1 = Train.new("123")
train2 = Train.new("Maks")

puts Train.all
puts Train.find("Maks")
