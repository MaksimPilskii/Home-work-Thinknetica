letters = ('а'..'я').to_a
vowels = %w[а е и о у ы э ю я]
vowels_letters = {}

letters.each do |letter|
  if vowels.include?(letter)
    vowels_letters[letter] = letters.index(letter) + 1
  end
end
