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
end

def input_to_index(input)
  converted_input = input.to_i-1
  
end

def move(board, index, character)
board[index] = character
puts display_board(board)
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
    else 
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, (current_player(board)))
  else 
    puts "Please enter a valid number"
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? { |win_index| board[win_index] == "X" } ||
    win_combination.all? { |win_index| board[win_index] == "O" }
  end
end

def full?(board)
  board.each {|a| return false if a == " "}
end

def draw?(board)
 if !won?(board) && full?(board)
   return true 
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  win = won?(board)
    if win
      return board[win[0]]
  end
end

def play(board)
while over?(board) != true
  turn(board)
  end
    if draw?(board) == true 
      puts "Cat's Game!"
    else 
      puts "Congratulations #{winner(board)}!"
    end
end