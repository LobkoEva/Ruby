class TicTacToe
  BOARD_SIZE = 3
  EMPTY = ' '
  PLAYER_X = 'X'
  PLAYER_O = 'O'

  def initialize
    @board = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE, EMPTY) }
    @current_player = PLAYER_X
  end

  def print_board
    @board.each_with_index do |row, i|
      puts row.join(' | ')
      puts '--------- ' if i < BOARD_SIZE - 1
    end
    puts
  end

  def game_over?
    (0...BOARD_SIZE).each do |i|
      return true if @board[i][0] == @board[i][1] && @board[i][1] == @board[i][2] && @board[i][0] != EMPTY
      return true if @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i] && @board[0][i] != EMPTY
    end

    return true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] != EMPTY
    return true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0] && @board[0][2] != EMPTY

    @board.each do |row|
      return false if row.include?(EMPTY)
    end
    true
  end

  def evaluate(player)
    opponent = (player == PLAYER_X) ? PLAYER_O : PLAYER_X

    (0...BOARD_SIZE).each do |i|
      if @board[i][0] == @board[i][1] && @board[i][1] == @board[i][2]
        return 10 if @board[i][0] == player
        return -10 if @board[i][0] == opponent
      end
      if @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i]
        return 10 if @board[0][i] == player
        return -10 if @board[0][i] == opponent
      end
    end

    if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
      return 10 if @board[0][0] == player
      return -10 if @board[0][0] == opponent
    end

    if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
      return 10 if @board[0][2] == player
      return -10 if @board[0][2] == opponent
    end

    0
  end

  def minimax(player, depth, is_maximizing)
    opponent = (player == PLAYER_X) ? PLAYER_O : PLAYER_X

    return evaluate(player) if game_over?

    return 0 if depth == 0

    best_score = is_maximizing ? -Float::INFINITY : Float::INFINITY

    (0...BOARD_SIZE).each do |i|
      (0...BOARD_SIZE).each do |j|
        if @board[i][j] == EMPTY
          @board[i][j] = (is_maximizing ? player : opponent)
          score = minimax(player, depth - 1, !is_maximizing)
          @board[i][j] = EMPTY

          if is_maximizing
            best_score = [score, best_score].max
          else
            best_score = [score, best_score].min
          end
        end
      end
    end

    best_score
  end

  def find_best_move(player, depth)
    best_score = -Float::INFINITY
    best_move = nil

    (0...BOARD_SIZE).each do |i|
      (0...BOARD_SIZE).each do |j|
        if @board[i][j] == EMPTY
          @board[i][j] = player
          score = minimax(player, depth, false)
          @board[i][j] = EMPTY

          if score > best_score
            best_score = score
            best_move = [i, j]
          end
        end
      end
    end

    best_move
  end

  def get_random_move
    available_moves = []

    (0...BOARD_SIZE).each do |i|
      (0...BOARD_SIZE).each do |j|
        available_moves << [i, j] if @board[i][j] == EMPTY
      end
    end

    return available_moves.sample unless available_moves.empty?
  end

  def play_game
    puts "Welcome to Tic-Tac-Toe! You are #{PLAYER_X} and the computer is #{PLAYER_O}."

    print 'Set the depth for computer difficulty (e.g., 0 for random moves, 4 for a challenging opponent): '
    depth = gets.chomp.to_i

    until game_over?
      print_board

      if @current_player == PLAYER_X
        loop do
          print 'Enter your move (row and column, e.g., "0 0"): '
          move = gets.chomp
          row, col = move.split.map(&:to_i)

          if (0...BOARD_SIZE).include?(row) && (0...BOARD_SIZE).include?(col) && @board[row][col] == EMPTY
            @board[row][col] = @current_player
            break
          else
            puts 'Invalid move. Try again.'
          end
        end
      else
        puts 'Computer is thinking...'
        computer_move = if depth > 0
                          find_best_move(PLAYER_O, depth)
                        else
                          get_random_move
                        end
        row, col = computer_move
        @board[row][col] = @current_player
      end

      @current_player = (@current_player == PLAYER_X) ? PLAYER_O : PLAYER_X
    end

    print_board

    if evaluate(PLAYER_O) == 10
      puts 'Player O wins!'
    elsif evaluate(PLAYER_X) == 10
      puts 'Player X wins!'
    else
      puts "It's a draw!"
    end
  end
end

game = TicTacToe.new
game.play_game
