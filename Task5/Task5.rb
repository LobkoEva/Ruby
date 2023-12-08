def generate_bad_character_table(pattern)
  table = {}
  pattern.each_char.with_index do |char, index|
    table[char] = index
  end
  table.default = -1
  table
end

def boyer_moore_search(text, pattern)
  n = text.length
  m = pattern.length
  return -1 if n < m

  bad_character_table = generate_bad_character_table(pattern)
  shift = 0

  while shift <= n - m
    j = m - 1

    while j >= 0 && pattern[j] == text[shift + j]
      j -= 1
    end

    if j < 0
      return shift
    else
      shift += [1, j - bad_character_table[text[shift + j]]].max
    end
  end

  return -1
end

loop do
  puts "Enter the text or '0' to exit:"
  text = gets.chomp

  break if text == '0'

  puts "Enter the pattern to search:"
  pattern = gets.chomp

  result = boyer_moore_search(text, pattern)

  if result != -1
    puts "Substring '#{pattern}' found starting at index #{result}"
  else
    puts "Substring '#{pattern}' not found in the text"
  end
end
