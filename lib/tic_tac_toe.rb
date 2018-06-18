class TicTacToe
  def initialize
    @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
    ]

   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end
   
   def input_to_index(input)
     @index = input.to_i - 1 
   end
   
   def move(index, token = 'X')
     @board[index] = token
   end
   
   def position_taken?(index)
     if @board[index] == 'X' || @board[index] == 'O'
       return true
     else
       return false
     end
   end
   
   def valid_move?(index)
     if position_taken?(index)==false && index.between?(0,8)==true
       return true
     end
       false
   end
   
   def turn
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(index)
       move(index, current_player)
     else
       turn
     end
     display_board
 end
   
   def turn_count
     count = 0
     @board.each do |el|
       if el == 'X' || el == 'O'
         count += 1 
       end
     end
       return count
   end  
   
   def current_player
     if turn_count % 2 == 0 
       'X'
     else
       'O'
     end
   end
    
   def won?
     WIN_COMBINATIONS.each do |arr|
       if @board[arr[0]] == @board[arr[1]] && @board[arr[0]] == @board[arr[2]] && @board[arr[0]] != ' '
        return arr
       end
     end
     return false
   end
   
   def full?
     @board.any? do |el|
       if el != 'X' && el != 'O'
         return false
       end
     end 
     return true
   end
   
   def draw?
     if full? && !won?
       return true 
     end 
   end 
   
   def over?
     if won? || draw?
       return true
     end
   end 
   
   def winner
     if won?
       arr = won?
       return @board[arr[0]]
     end
   end
   
   def play 
     until won? || draw?
     turn 
     end 
     if draw?
       puts 'Cat\'s Game!'
     else 
       puts "Congratulations #{winner}!"
     end
   end
   
 end