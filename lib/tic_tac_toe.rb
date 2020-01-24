class TicTacToe
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], #left column
  [1,4,7], # middle column
  [2,5,8], #right column
  [0,4,8], #diagonal 1
  [2,4,6] #diagonal 2
  ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(user_input)
	user_input.to_i - 1
end

def move(index, character)
@board[index] = character

end

def position_taken?(index)
   !(@board[index] == " ")
end

def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8)
    true
    else 
    false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index) == true
    move(index, (current_player))
  else 
    puts "Please enter a valid number"
    turn
  end
  puts display_board
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? { |win_index| @board[win_index] == "X" } ||
    win_combination.all? { |win_index| @board[win_index] == "O" }
  end
end

def full?
  @board.each {|a| return false if a == " "}
end

def draw?
 if !won? && full?
   return true 
  end
end

def over?
  if won? || full? || draw?
    return true
  end
end

def winner
  win = won?
    if win
      return @board[win[0]]
  end
end

def play
while over? != true
  turn
  end
    if draw? == true 
      puts "Cat's Game!"
    else 
      puts "Congratulations #{self.winner}!"
    end
end

end