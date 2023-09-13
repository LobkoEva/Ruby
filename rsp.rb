puts "rock, scissors, paper"
rsp = ["rock", "scissors", "paper"]

loop do
  computer = rsp.sample

  if ARGV.length == 1
    user = ARGV[0].downcase
    ARGV.clear
  else
    puts "Enter: rock, scissors, paper or exit"
    user = gets.chomp.downcase
  end

  if user == "exit"
    break
  elsif !rsp.include?(user)
    puts "Incorrect choice. Enter: rock, scissors, paper or exit"
    next
  end

  puts "User : #{user.capitalize}"
  puts "Computer : #{computer.capitalize}"

  if user == computer
    puts "Dead heat"
  elsif(user == "rock" && computer == "scissors") ||
        (user == "scissors" && computer == "paper") ||
        (user == "paper" && computer == "rock")
    puts "User win!"
  else
    puts "Computer win!"
  end
end

puts "Game over"