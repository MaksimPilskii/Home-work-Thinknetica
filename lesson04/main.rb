require './train'
require './route'
require './station'
require './cargo_train'
require './passenger_train'
require './wagon_cargo'
require './wagon_passenger'

stations = []
trains = []
wagons = []
new_train =""
new_wagon =""

begin
puts "Выбери нужное вам действие:"
puts "Нажмите 1, если хотите выполнить действия со станцией"
puts "Нажмите 2, если хотите выполнить действия с поездами и вагонами"
puts "Нажмите 3, если хотите выполнить действия с маршрутом"
puts "Нажмите 0, если хотите выйти из программы"

choice = gets.chomp

case choice
when "1"
  puts "1. Создать станцию"
  puts "2. Прибытие поезда на станцию"
  puts "3. Убытие поезда со станции"
  puts "4. Просмотреть список станций и поездов на станции"

  menu = gets.chomp

  if menu == "1"
    puts "Введите название станции"
    name_of_station = gets.chomp
    stations << station = Station.new(name_of_station)
    puts "Вы создали станцию #{station.name}"

  elsif menu == "2"
    station.arrival_trains(new_train)
    puts "#{new_train.number} прибыл на станцию #{station.name}"
  elsif menu == "3"
    station.departure_train(new_train)
    puts "#{new_train.number} убыл со станции #{station.name}"
  elsif menu == "4"
    stations_to_display = stations.map do |station|
    print "На станции #{station.name} стоят следующие поезда: "
      unless station.trains.nil?
        station.trains.each do |train|
        print "#{train.number}"
        end
      end
      puts
    end
  end
when "2"
  puts "1. Создать почтовый поезд"
  puts "2. Создать пассажирский поезд"
  puts "3. Создать почтовый вагон"
  puts "4. Создать пассажирский вагон"
  puts "5. Добавить вагон к поезду"
  puts "6. Отцепить вагон от поезда"

  menu = gets.chomp

  if menu == "1"
    puts "Для создания почтового поезда необходимо ввести его номер"
    number = gets.chomp

    new_train = CargoTrain.new(number)
    trains << new_train
  elsif menu == "2"
    puts "Для создания пассажирского поезда необходимо ввести его номер"
    number = gets.chomp

    new_train = PassengerTrain.new(number)
    trains << new_train
  elsif menu == "3"
    puts "Для создания почтового вагона необходимо ввести его номер"
    number = gets.chomp

    new_wagon = CargoWagon.new(number)
    wagons << new_wagon
  elsif menu == "4"
    puts "Для создания пассажирского вагона необходимо ввести его номер"
    number = gets.chomp

    new_wagon = PassengerWagon.new(number)
    wagons << new_wagon
  elsif menu == "5"
    new_train.attach_wagon(new_wagon)
    puts "Вы добавили вагон к поезду #{new_train.number} вагон #{new_wagon.number_wagon} "
  elsif menu == "6"
    puts "Введите номер вагона, который нужно удалить"
    wagon_to_remove = gets.chomp

    new_train.remove_wagon(wagon_to_remove)
    puts "Вагон #{wagon_to_remove} был отцеплен от поезда #{new_train.number}"
  end
when "3"
  puts "1. Создать маршрут"
  puts "2. Добавить станцию"
  puts "3. Удалить станцию"
  puts "4. Назначить маршрут поезду"
  puts "5. Переместить поезд по маршрут вперед"
  puts "6. Переместить поезд по маршруту назад"

  menu = gets.chomp

  if menu == "1"
    puts "Для создания маршрута необходимы начальная и конечная станции"
    puts "Введите начальную станцию"
    first_station = gets.chomp

    puts "Введите конечную станцию"
    last_station = gets.chomp

    route = Route.new(first_station, last_station)

    puts "Вы можете добавить промежуточную станцию, если не хотите просто нажмите Enter"
    intermediate_station = gets.chomp

    route.add_station(intermediate_station) if intermediate_station != ""
  
    puts "создали маршрут: #{route.whole_route}"
  elsif menu == "2"
    puts "Укажите название станции, которую нужно добавить к маршруту"
    station = gets.chomp

    route.add_station(station)
    puts "Вы добавили к маршруту станцию #{station}"
  elsif menu == "3"
    puts "Укажите название станции, которую нужно удалить из маршрута"
    station = gets.chomp

    route.delete_station(station)
    puts "#{station} была удалена из маршрута"
  elsif menu == "4"
    new_train.get_station(route)
    puts "Поезду #{new_train.number} был назначен маршрут #{route.whole_route}"
  elsif menu == "5"
    new_train.move_to_next_station
    puts "Поезд #{new_train.number} был перемещен на станцию #{new_train.current_station}"
  elsif menu == "6"
    new_train.move_to_previous_station
    puts "Поезд #{new_train.number} был перемещен на станцию #{new_train.current_station}"
  end
end
end while choice != "0" 
