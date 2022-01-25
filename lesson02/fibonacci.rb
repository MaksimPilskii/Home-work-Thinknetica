array_fibonacci = [0, 1]

loop do
  result = array_fibonacci[-1] + array_fibonacci[-2] 
  break if result > 100
  array_fibonacci << result
end
