def word_count(sentence)

  word_count_hash = {}

  words = sentence.split(' ')

  words.each do |word|
    cleaned_word = word.gsub(/([.,-])/, '')

    word_count_hash[cleaned_word.downcase] ||= 0
    word_count_hash[cleaned_word.downcase] += 1
  end

  word_count_hash
end

sentence = "Це речення має кілька слів, і деякі слова повторюються. Слово та слово - це два різні слова."
result = word_count(sentence)
puts result