puts "Введите размер первой стороны треугольника?"
first_side = gets.to_f

puts "Введите размер второй стороны треугольника?"
second_side = gets.to_f

puts "Введите размер третьей стороны треугольника?"
third_side = gets.to_f

if first_side == second_side && first_side == third_side
  puts "Треугольник является равнобедренным и равносторонним"
elsif first_side > second_side && first_side > third_side
  right_triangle = first_side ** 2 == second_side ** 2 +  third_side ** 2
elsif first_side < second_side && second_side > third_side
  right_triangle = second_side ** 2 == first_side ** 2 + third_side ** 2
elsif third_side > first_side && third_side > second_side
  right_triangle = third_side ** 2 == first_side ** 2 +  second_side ** 2
end

if right_triangle == true
  puts "Поздравляем! Треугольник является прямоугольным"
else
  puts "Треугольник не является прямоугольным"
end
