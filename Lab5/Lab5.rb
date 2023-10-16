def roman_to_int(s)
  roman_dict = {
    'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50,
    'C' => 100, 'D' => 500, 'M' => 1000
  }

  result = 0
  prev_value = 0

  s.reverse.each_char do |char|
    value = roman_dict[char]
    if value < prev_value
      result -= value
    else
      result += value
    end
    prev_value = value
  end

  result
end

def int_to_roman(n)
  roman_numerals = {
    1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X',
    40 => 'XL', 50 => 'L', 90 => 'XC', 100 => 'C',
    400 => 'CD', 500 => 'D', 900 => 'CM', 1000 => 'M'
  }

  result = ''

  roman_numerals.keys.sort.reverse.each do |value|
    while n >= value
      result += roman_numerals[value]
      n -= value
    end
  end

  result
end

loop do
  print 'Enter an integer from 1 to 4000 or "0" to exit: '
  input = gets.chomp

  break if input.downcase == '0'

  n = input.to_i

  if (1...4000).include?(n)
    roman = int_to_roman(n)
    puts "Roman numeral representation#{n}: #{roman}"
  else
    puts 'A number in the range 1 to 3999'
  end
end
