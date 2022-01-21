array_fibonacci = [0, 1]

(2..100 - 1).each { array_fibonacci << array_fibonacci[-1] + array_fibonacci[-2] }
