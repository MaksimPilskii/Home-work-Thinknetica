puts "What is your name?"
name = gets.chomp

puts "Enter your height?"
height = gets.to_i

ideal_weight = (height - 110) * 1.15

if ideal_weight >= 0
  puts "#{name}  ваш идеальный вес #{ideal_weight.to_i} кг "
else
  puts "У вас уже идеальный вес"
end
git