# frozen_string_literal: true

class Interface
  attr_accessor :stations, :route, :trains, :wagons, :station

  def initialize
    @stations = []
    @routes = []
    @wagons = []
    @trains = []
  end

  def run
    choice = ''

    while choice != '0'

      menu_begin

      choice = gets.chomp

      case choice
      when '1'
        menu_stations
      when '2'
        menu_trains
      when '3'
        menu_route
      end
    end
  end

  private

  def menu_begin
    puts 'Выбери нужное вам действие:'
    puts 'Нажмите 1, если хотите выполнить действия со станцией'
    puts 'Нажмите 2, если хотите выполнить действия с поездами и вагонами'
    puts 'Нажмите 3, если хотите выполнить действия с маршрутом'
    puts 'Нажмите 0, если хотите выйти из программы'
  end

  def menu_stations
    puts '1. Создать станцию'
    puts '2. Прибытие поезда на станцию'
    puts '3. Убытие поезда со станции'
    puts '4. Просмотреть список станций и поездов на станции'
    puts '5. Занять объем или место в вагоне'

    menu = gets.chomp

    case menu
    when '1'
      add_station
    when '2'
      arrival_of_the_train_at_the_station
    when '3'
      departure_of_the_train_from_the_station
    when '4'
      show_trains_on_stations
    when '5'
      take_up_volume_or_space
    end
  end

  def menu_trains
    puts '1. Создать почтовый поезд'
    puts '2. Создать пассажирский поезд'
    puts '3. Создать почтовый вагон'
    puts '4. Создать пассажирский вагон'
    puts '5. Добавить вагон к поезду'
    puts '6. Отцепить вагон от поезда'
    puts '7. Список вагонов у поезда'

    menu = gets.chomp

    case menu
    when '1'
      create_cargo_train
    when '2'
      create_passenger_train
    when '3'
      create_cargo_wagon
    when '4'
      create_passenger_wagon
    when '5'
      attach_the_wagon_to_the_train
    when '6'
      unhook_the_wagon_from_the_train
    when '7'
      show_wagons
    end
  end

  def menu_route
    puts '1. Создать маршрут'
    puts '2. Добавить станцию'
    puts '3. Удалить станцию'
    puts '4. Назначить маршрут поезду'
    puts '5. Переместить поезд по маршрут вперед'
    puts '6. Переместить поезд по маршруту назад'

    menu = gets.chomp

    case menu
    when '1'
      add_route
    when '2'
      add_a_station_to_a_route
    when '3'
      delete_a_station_a_route
    when '4'
      assign_a_route
    when '5'
      move_train_to_next_station
    when '6'
      move_train_to_previous_station
    end
  end

  # методы первого меню
  def add_station
    puts 'Введите название станции (только буквы)'
    name_of_station = gets.chomp
    station = Station.new(name_of_station)
    @stations << station
    puts "Вы создали станцию #{station.name}"
  end

  def arrival_of_the_train_at_the_station
    list_of_stations

    puts 'Выберите станцию, на которую должен прибыть поезд'
    station_selection = gets.to_i - 1

    list_of_trains

    puts 'Выберите поезд, который должен прибыть на станцию'
    train_selection = gets.to_i - 1

    @stations[station_selection].arrival_trains(@trains[train_selection])

    puts "#{@trains[train_selection].number} прибыл на станцию #{@stations[station_selection].name}"
  end

  def departure_of_the_train_from_the_station
    list_of_stations

    puts 'Выберите станцию, откуда должен убыть поезд'
    station_selection = gets.to_i - 1

    list_of_trains

    puts 'Выберите поезд, который должен убыть со станции'
    train_selection = gets.to_i - 1

    @stations[station_selection].departure_train(@trains[train_selection])

    puts "#{@trains[train_selection].number} убыл со станции #{@stations[station_selection].name}"
  end

  def take_up_volume_or_space
    list_of_wagons

    puts 'Выберите вагон в котором хотите занять место или объем'
    select_wagon = gets.to_i - 1

    if wagons[select_wagon].type == 'Passenger'
      wagons[select_wagon].take_a_seat
    else
      puts 'Введите объем, который вы хотите занять в вагоне'
      selected_volume = gets.to_i

      wagons[select_wagon].occupy_volume(selected_volume)
    end
  end

  def show_trains_on_stations
    list_of_stations

    puts 'Укажите станцию, на которой вы хотите посмотреть поезда'
    select_station = gets.to_i - 1

    block = lambda do |train|
      puts "номер поезда #{train.number}, тип: #{train.type}, количество вагонов: #{train.wagons_trains.count}"
    end

    @stations[select_station].each_train(block)
  end

  # методы второго меню

  def create_cargo_train
    puts 'Для создания почтового поезда необходимо ввести его номер (формат номера (БББ-ЦЦ)'
    number = gets.chomp

    train = CargoTrain.new(number)
    @trains << train
  rescue StandardError
    puts 'Введенные данные не соответствуют формату, попробуйте снова'
    retry
  end

  def create_passenger_train
    puts 'Для создания пассажирского поезда необходимо ввести его номер (формат номера (БББ-ЦЦ)'
    number = gets.chomp

    train = PassengerTrain.new(number)
    @trains << train
  rescue StandardError
    puts 'Введенные данные не соответствуют формату, попробуйте снова'
    retry
  end

  def create_cargo_wagon
    puts 'Для создания почтового вагона необходимо ввести его номер (формат номера (БББ-ЦЦ)'
    number = gets.chomp

    puts 'Введите объем, который вмещает вагон'
    total_volume = gets.to_i

    wagon = CargoWagon.new(number, total_volume)
    @wagons << wagon
  rescue StandardError
    puts 'Введенные данные не соответствуют формату, попробуйте снова'
    retry
  end

  def create_passenger_wagon
    puts 'Для создания пассажирского вагона необходимо ввести его номер (формат номера (БББ-ЦЦ)'
    number = gets.chomp

    puts 'Введите число пассажирских мест в вагоне'
    passenger_seats = gets.to_i

    wagon = PassengerWagon.new(number, passenger_seats)
    @wagons << wagon
  rescue StandardError
    puts 'Введенные данные не соответствуют формату, попробуйте снова'
    retry
  end

  def attach_the_wagon_to_the_train
    list_of_trains

    puts 'Выберите поезд к которому нужно присоединить вагон'
    train_selection = gets.to_i - 1

    list_of_wagons

    puts 'Выберите вагон, который нужно присоединить к поезду'
    wagon_selection = gets.to_i - 1

    puts "Вы добавили к поезду #{@trains[train_selection].number} вагон #{@wagons[wagon_selection].number} "

    add_wagon_to_train(train_selection, wagon_selection)
  end

  def unhook_the_wagon_from_the_train
    list_of_trains

    puts 'Выберите поезд от которого нужно отсоединить вагон'
    train_selection = gets.to_i - 1

    list_of_wagons_at_the_train(train_selection)

    puts 'Введите номер вагона, который нужно отсоединить'
    wagon_selection = gets.to_i - 1

    if @wagons.include?(@wagons[wagon_selection])
      puts "Вагон #{@wagons[wagon_selection].number} был отцеплен от поезда #{@trains[train_selection].number}"
    end

    @trains[train_selection].remove_wagon(wagon_selection)
  end

  def show_wagons
    block = lambda do |wagon|
      if wagon.type == 'Passenger'
        print "Вагон с номером: #{wagon.number}, кол-во свободных мест: " \
        "#{wagon.available_seats}, кол-во занятых мест: #{wagon.occupied_places}"
      else
        print "Вагон с номером: #{wagon.number}, свободный объем:" \
        " #{wagon.free_volume}, занятный объем: #{wagon.the_occupied_volume}"
      end
      puts
    end

    list_of_trains

    puts 'Выберите поезд у которого хотите посмотреть вагоны '
    select_train = gets.to_i - 1

    @trains[select_train].each_wagon(block)
  end

  # методы третьего меню
  def add_route
    puts 'Для создания маршрута необходимы начальная и конечная станции (только буквы)'
    puts 'Введите начальную станцию'
    first_station = gets.chomp

    puts 'Введите конечную станцию'
    last_station = gets.chomp

    route = Route.new(first_station, last_station)

    puts "создали маршрут: #{route.whole_route}"
    @routes << route
  end

  def move_train_to_next_station
    list_trains_with_route

    train_selection = gets.to_i - 1

    @trains[train_selection].move_to_next_station
    puts "Поезд #{@trains[train_selection].number} был перемещен на станцию #{@trains[train_selection].current_station}"
  end

  def move_train_to_previous_station
    list_trains_with_route

    train_selection = gets.to_i - 1

    @trains[train_selection].move_to_previous_station
    puts "Поезд #{@trains[train_selection].number} был перемещен на станцию #{@trains[train_selection].current_station}"
  end

  def assign_a_route
    list_of_trains
    train_selection = gets.to_i - 1

    list_of_route
    route_selection = gets.to_i - 1

    @trains[train_selection].get_station(@routes[route_selection])
    puts "Поезду #{@trains[train_selection].number} был назначен маршрут #{@routes[route_selection].whole_route}"
  end

  def list_of_stations
    Station.all.each.with_index(1) do |station, index|
      puts "#{index}. #{station.name}"
    end
  end

  def list_of_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index}. поезд с номером #{train.number}"
    end
  end

  def list_of_wagons
    @wagons.each.with_index(1) do |wagon, index|
      puts "#{index}. #{wagon.number}"
    end
  end

  def list_of_wagons_at_the_train(_train_selection)
    @trains.each do |train|
      train.wagons_trains.each.with_index(1) do |wagon, index|
        puts "#{index}. #{wagon}"
      end
    end
  end

  def list_trains_with_route
    @trains.each.with_index(1) do |train, index|
      print "#{index}. Поезд #{train.route.whole_route.join('-')}"
      puts
    end
  end

  def list_of_route
    @routes.each.with_index(1) do |route, index|
      puts "#{index}. Маршрут #{route.whole_route}"
    end
  end

  def add_wagon_to_train(train_selection, wagon_selection)
    @trains[train_selection].attach_wagon(@wagons[wagon_selection])
    @wagons.delete_at(wagon_selection)
  end

  def add_a_station_to_a_route
    if @routes.nil?
      list_of_route

      puts 'Укажите маршрут к которому необходимо добавить станцию?'
      route_select = gets.to_i - 1

      puts 'Укажите название станции, которую нужно добавить к маршруту (только буквы)'
      station = gets.chomp

      @routes[route_select].add_intermediate_station(station)
      puts "Вы добавили к маршруту станцию #{station}"
    else
      puts 'Еще не создано ни одного маршрута'
    end
  end

  def delete_a_station_a_route
    puts 'Станции: '
    puts route.whole_route.to_s

    puts 'Укажите название станции, которую нужно удалить из маршрута'
    station = gets.chomp

    puts "#{station} была удалена из маршрута" if route.delete_station(station)
  end
end
