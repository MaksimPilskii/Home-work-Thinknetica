puts "Введите коэффициент a?"
first_ratio = gets.to_f

puts "Введите коэффициент b?"
second_ratio = gets.to_f

puts "Введите коэффициент c?"
third_ratio = gets.to_f

discriminant = second_ratio ** 2 - (4 * first_ratio * third_ratio)
p discriminant

if discriminant > 0 
  x1 = (second_ratio * -1 + Math.sqrt(discriminant)) / (2 * first_ratio)
  x2 = (second_ratio * -1 - Math.sqrt(discriminant)) / (2 * first_ratio)
  puts "Уравнение имеет два корня х1 = #{x1}, x2 = #{x2} "
elsif discriminant == 0
  x1 = (second_ratio * -1) / (2 * first_ratio)
  puts "Оба корня уравнения одинаковые и равняются #{x1} "
else
  puts "У уравнения нет корней"
end
