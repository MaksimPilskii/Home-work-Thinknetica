class Interface
attr_accessor :stations, :route, :trains, :wagons, :station

  @route
  @station
  @trains
  @wagon

  def initialize
    @stations = []
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
      puts "Введите название станции"
      name_of_station = gets.chomp
      @station = Station.new(name_of_station)
      @stations << @station
      puts "Вы создали станцию #{station.name}"
    when "2"
      @station.arrival_trains(@train.number)
      puts "#{@train.number} прибыл на станцию #{@station.name}"
    when "3"
      @station.departure_train(@train)
      puts "#{@train.number} убыл со станции #{@station.name}"
    when "4"
      @stations.map do |station|
      print "На станции #{station.name} стоят следующие поезда: "
        unless station.trains.nil?
          station.trains.each do |train|
          print "#{train}"
          end
        end
      puts
      end
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
    when "2"
      puts "Для создания пассажирского поезда необходимо ввести его номер"
      number = gets.chomp

      @train = PassengerTrain.new(number)
    when "3"
      puts "Для создания почтового вагона необходимо ввести его номер"
      number = gets.chomp

      @wagon = CargoWagon.new(number)
    when "4"
      puts "Для создания пассажирского вагона необходимо ввести его номер"
      number = gets.chomp

      @wagon = PassengerWagon.new(number)
    when "5"
      @train.attach_wagon(@wagon)
      puts "Вы добавили вагон к поезду #{@train.number} вагон #{@wagon.number} "
    when "6"
      puts "Введите номер вагона, который нужно удалить"
      wagon_to_remove = gets.chomp

      @train.remove_wagon(wagon_to_remove)
      
      puts "Вагон #{wagon_to_remove} был отцеплен от поезда #{@train.number}" if @wagon.number.include?(wagon_to_remove)
    end
  end
  def menu_route 
    puts "1. Создать маршрут"
    puts "2. Добавить станцию"
    puts "3. Удалить станцию"
    puts "4. Назначить маршрут поезду"
    puts "5. Переместить поезд по маршрут вперед"
    puts "6. Переместить поезд по маршруту назад"
    
    menu = gets.chomp
    
    case menu
    when "1"
      puts "Для создания маршрута необходимы начальная и конечная станции"
      puts "Введите начальную станцию"
      first_station = gets.chomp
    
      puts "Введите конечную станцию"
      last_station = gets.chomp
    
      @route = Route.new(first_station, last_station)
    
      puts "Вы можете добавить промежуточную станцию, если не хотите просто нажмите Enter"
      intermediate_station = gets.chomp
      
      @route.add_station(intermediate_station) if intermediate_station != ""
      
      puts "создали маршрут: #{@route.whole_route}"
    when "2"
      puts "Укажите название станции, которую нужно добавить к маршруту"
      @station = gets.chomp
    
      @route.add_station(@station)
      puts "Вы добавили к маршруту станцию #{@station}"
    when "3"
      puts "Укажите название станции, которую нужно удалить из маршрута"
      @station = gets.chomp
    
      @route.delete_station(@station)
      puts "#{@station} была удалена из маршрута"
    when "4"
      @train.get_station(@route)
      puts "Поезду #{@train.number} был назначен маршрут #{@route.whole_route}"
    when "5"
      @train.move_to_next_station
      puts "Поезд #{@train.number} был перемещен на станцию #{@train.current_station}"
    when "6"
      @train.move_to_previous_station
      puts "Поезд #{@train.number} был перемещен на станцию #{@train.current_station}"
    end
  end
end
