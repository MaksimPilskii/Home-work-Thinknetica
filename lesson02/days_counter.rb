months = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
days_counter = 0

puts "Введите день"
day = gets.to_i 

puts "Введите месяц"
month= gets.to_i

puts "Введите год"
year = gets.to_i

if year % 4 == 0 && year % 100 != 0
  leap_year = true
elsif year % 100 == 0 && year % 400 == 0
  leap_year = true
end

for i in (0..month - 2)
  days_counter += months[i]
end

if leap_year == true && month > 2
  days_counter += 1
end 

puts "Порядковы номер дня: #{days_counter + day}"
