class Interface
attr_accessor :stations, :route, :trains, :wagons, :station
  
  def initialize
    @stations = []
    @routes = []
    @wagons = []
    @trains = []
  end

  def menu_begin
    puts "Выбери нужное вам действие:"
    puts "Нажмите 1, если хотите выполнить действия со станцией"
    puts "Нажмите 2, если хотите выполнить действия с поездами и вагонами"
    puts "Нажмите 3, если хотите выполнить действия с маршрутом"
    puts "Нажмите 0, если хотите выйти из программы"
  end

  def menu_stations
    puts "1. Создать станцию"
    puts "2. Прибытие поезда на станцию"
    puts "3. Убытие поезда со станции"
    puts "4. Просмотреть список станций и поездов на станции"

    menu = gets.chomp

    case menu
    when "1"
      add_station
    when "2"
      list_of_stations
      
      puts "Выберите станцию, на которую должен прибыть поезд"
      station_selection = gets.to_i - 1
      
      list_of_trains
      
      puts "Выберите поезд, который должен прибыть на станцию"
      train_selection = gets.to_i - 1

      @stations[station_selection].arrival_trains(@trains[train_selection])
      
      puts "#{@train.number} прибыл на станцию #{@station.name}"
    when "3"
      list_of_stations
      
      puts "Выберите станцию, откуда должен убыть поезд"
      station_selection = gets.to_i - 1
      
      list_of_trains
      
      puts "Выберите поезд, который должен убыть со станции"
      train_selection = gets.to_i - 1

      @stations[station_selection].departure_train(@trains[train_selection])
      
      puts "#{@train.number} убыл со станции #{@station.name}"
    when "4"
      list_stations_with_trains
    end
  end

  def menu_trains
    puts "1. Создать почтовый поезд"
    puts "2. Создать пассажирский поезд"
    puts "3. Создать почтовый вагон"
    puts "4. Создать пассажирский вагон"
    puts "5. Добавить вагон к поезду"
    puts "6. Отцепить вагон от поезда"

    menu = gets.chomp

    case menu
    when "1"
      puts "Для создания почтового поезда необходимо ввести его номер"
      number = gets.chomp

      @train = CargoTrain.new(number)
      @trains << @train
    when "2"
      puts "Для создания пассажирского поезда необходимо ввести его номер"
      number = gets.chomp

      @train = PassengerTrain.new(number)
      @trains << @train
    when "3"
      puts "Для создания почтового вагона необходимо ввести его номер"
      number = gets.chomp

      @wagon = CargoWagon.new(number)
      @wagons << @wagon
    when "4"
      puts "Для создания пассажирского вагона необходимо ввести его номер"
      number = gets.chomp

      @wagon = PassengerWagon.new(number)
      @wagons << @wagon 
    when "5"
      list_of_trains

      puts "Выберите поезд к которому нужно присоединить вагон"
      train_selection = gets.to_i - 1
      
      list_of_wagons

      puts "Выберите вагон, который нужно присоединить к поезду"
      wagon_selection = gets.to_i - 1

      puts "Вы добавили к поезду #{@trains[train_selection].number} вагон #{@wagons[wagon_selection].number} "
      
      add_wagon_to_train(train_selection, wagon_selection)
    when "6"
      list_of_trains

      puts "Выберите поезд от которого нужно отсоединить вагон"
      train_selection = gets.to_i - 1
      
      list_of_wagons_at_the_train(train_selection)
      
      puts "Введите номер вагона, который нужно отсоединить"
      wagon_selection = gets.to_i - 1
  
      puts "Вагон #{@wagons[wagon_selection].number} был отцеплен от поезда #{@trains[train_selection].number}" if @wagons.include?(@wagons[wagon_selection])

      @train.remove_wagon(wagon_selection)
    end
  end

  def menu_route 
    puts "1. Создать маршрут"
    puts "2. Добавить станцию"
    puts "3. Удалить станцию"
    puts "4. Назначить маршрут поезду"
    puts "5. Переместить поезд по маршрут вперед"
    puts "6. Переместить поезд по маршруту назад"
    puts "7. Выбрать поезд с маршрутом"
    
    menu = gets.chomp
    
    case menu
    when "1"
      add_route
    when "2"
      add_a_station_to_a_route
    when "3"
      delete_a_station_a_route 
    when "4"
      @train.get_station(@route)
      puts "Поезду #{@train.number} был назначен маршрут #{@route.whole_route}"
    when "5"
      @train.move_to_next_station
      puts "Поезд #{@train.number} был перемещен на станцию #{@train.current_station}"
    when "6"
      @train.move_to_previous_station
      puts "Поезд #{@train.number} был перемещен на станцию #{@train.current_station}"
    when "7"
      list_trains_with_route
      train_selection = gets.to_i - 1

      @train = trains[train_selection]
    end
  end

  def add_station 
    puts "Введите название станции"
    name_of_station = gets.chomp
    @station = Station.new(name_of_station)
    @stations << @station
    puts "Вы создали станцию #{station.name}"
  end
 

  def add_wagon_to_train(train_selection, wagon_selection)
    @trains[train_selection].attach_wagon(@wagons[wagon_selection])
    @wagons.delete_at(wagon_selection)
  end
  
  def add_route
    puts "Для создания маршрута необходимы начальная и конечная станции"
    puts "Введите начальную станцию"
    first_station = gets.chomp
    
    puts "Введите конечную станцию"
    last_station = gets.chomp
    
    @route = Route.new(first_station, last_station)
          
    puts "создали маршрут: #{@route.whole_route}"
    @routes << @route
  end

  def add_a_station_to_a_route
    puts "Укажите название станции, которую нужно добавить к маршруту"
    @station = gets.chomp
  
    @route.add_intermediate_station(@station)
    puts "Вы добавили к маршруту станцию #{@station}"
  end

  def delete_a_station_a_route 
    puts "Станции: "
    puts "#{@route.whole_route}"
    
    puts "Укажите название станции, которую нужно удалить из маршрута"
    @station = gets.chomp
      
    puts "#{@station} была удалена из маршрута" if @route.delete_station(@station)
  end


private

  def list_of_stations
    @stations.each.with_index(1) do |station, index|
      puts "#{index}. #{station.name}"
    end
  end

  def list_of_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index}. поезд с номером #{train.number}"
    end
  end

  def list_stations_with_trains
    @stations.map do |station|
      print "На станции #{station.name} стоят следующие поезда: "
        unless station.trains.nil?
          station.trains.each do |train|
          print "#{train.number}"
          end
        end
      puts
    end
  end
 
  def list_of_wagons
    @wagons.each.with_index(1) do |wagon, index|
      puts "#{index}. #{wagon.number}"
    end
  end

  def list_of_wagons_at_the_train(train_selection)
    @trains.each do |train|
      train.wagons_trains.each.with_index(1) do |wagon, index|
        puts "#{index}. #{wagon}"
      end
    end
  end

  def list_trains_with_route
    @trains.each.with_index(1) do |item, index|
      print "#{index}. Поезд #{item.route.whole_route.join('-')}"
      puts
    end
  end 
end