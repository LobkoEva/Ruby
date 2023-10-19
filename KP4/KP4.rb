def generate_password(length)
  characters = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
  password = (0...length).map { characters[rand(characters.length)] }.join
  return password
end

loop do
  puts "Enter the desired password length (or 'exit' to quit): "
  user_input = gets.chomp
  break if user_input.downcase == 'exit'

  begin
    password_length = Integer(user_input)
    generated_password = generate_password(password_length)
    puts "Your random passwod: #{generated_password}"
  rescue ArgumentError
    puts "Invalid input. Please enter an integer for the password length"
  end
end


