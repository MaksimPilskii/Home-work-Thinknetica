months = {
  январь: 31,
  февраль: 28,
  март: 31,
  апрель: 30,
  май: 31,
  июнь: 30,
  июль: 30,
  август: 31,
  сентябрь: 30,
  октябрь: 31,
  ноябрь: 30,
  декабрь: 31 }

months.each do |month, days|
  puts "#{month}" if days == 30
end
