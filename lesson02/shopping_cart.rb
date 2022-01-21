if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

shopping_cart = Hash.new 
result = 0

loop do
  puts "Введите наименование товара"
  title = gets.chomp

  break if  title == "стоп"

  puts "Введите цену товара"
  price = gets.to_f

  puts "Введите количество товаров"
  quanity = gets.to_f
  
  shopping_cart[title] = {price: price, quanity: quanity}
end

shopping_cart.each do |title, price_quanity|
  puts "товар #{title} стоимость: #{price_quanity[:price]} количество #{price_quanity[:quanity]}, стоимость позиции: #{price_quanity[:price] * price_quanity[:quanity]}"

  result += price_quanity[:price] * price_quanity[:quanity]
end

puts "Общий итог: #{result}"
