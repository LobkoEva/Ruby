def sort_numbers(numbers, order)
  if order == 1
    numbers.sort!
  elsif order == 2
    numbers.sort! { |a, b| b <=> a }
  else
    puts "Incorrect choice. Enter 1 for ascending or 2 for descending."
    return
  end

  puts "Sorted list: #{numbers}"
end

loop do
print "Enter a list of numbers separated by spaces (or 'exit' to exit):  "
user_input = gets.chomp

  break if user_input.downcase == 'exit'
numbers = user_input.split.map(&:to_i)

print " Select the sort order(1 - increase, 2 - decrease): "
order = gets.chomp.to_i

# Викликаємо функцію сортування
sort_numbers(numbers, order)

end