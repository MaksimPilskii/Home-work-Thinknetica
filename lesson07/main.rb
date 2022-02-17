require './interface'
require './train'
require './route'
require './station'
require './cargo_train'
require './passenger_train'
require './wagon'
require './wagon_cargo'
require './wagon_passenger'
require 'pry'

interface = Interface.new
interface.run
