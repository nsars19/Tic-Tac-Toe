

require './classes.rb'

def run
  puts "Welcome to Tic Tac Toe!!\n"
  puts "You must choose a number for your selection. Each number corresponds with"
  puts "a spot on the grid, like so:\n\n"
  puts "1 | 2 | 3 "
  puts "----------"
  puts "4 | 5 | 6 "
  puts "----------"
  puts "7 | 8 | 9 \n\n"
  
  player1 = Classes::Player.new 
  player2 = Classes::Player.new 
  game = Classes::Board.new

  cell_picker = Proc.new do |choice, x_or_o|
    good_response = false
    until good_response
      case choice
      when 1
        if game.grid[0][0] == " "
          Classes::Cell.new
          game.grid[0][0] = x_or_o
          good_response = true
        else
          puts "Please select an empty space!"
          choice = gets.chomp.to_i
        end
      when 2
        if game.grid[0][1] == " "
          Classes::Cell.new
          game.grid[0][1] = x_or_o
          good_response = true
        else
          puts "Please select an empty space!"
          choice = gets.chomp.to_i
        end
      when 3
        if game.grid[0][2] == " "
          Classes::Cell.new
          game.grid[0][2] = x_or_o
          good_response = true
        else
          puts "Please select an empty space!"
          choice = gets.chomp.to_i
        end
      when 4
        if game.grid[1][0] == " "
          Classes::Cell.new
          game.grid[1][0] = x_or_o
          good_response = true
        else
          puts "Please select an empty space!"
          choice = gets.chomp.to_i
        end
      when 5
        if game.grid[1][1] == " "
          Classes::Cell.new
          game.grid[1][1] = x_or_o
          good_response = true
        else
          puts "Please select an empty space!"
          choice = gets.chomp.to_i
        end
      when 6
        if game.grid[1][2] == " "
          Classes::Cell.new
          game.grid[1][2] = x_or_o
          good_response = true
        else
          puts "Please select an empty space!"
          choice = gets.chomp.to_i
        end
      when 7
        if game.grid[2][0] == " "
          Classes::Cell.new
          game.grid[2][0] = x_or_o
          good_response = true
        else
          puts "Please select an empty space!"
          choice = gets.chomp.to_i
        end
      when 8
        if game.grid[2][1] == " "
          Classes::Cell.new
          game.grid[2][1] = x_or_o
          good_response = true
        else
          puts "Please select an empty space!"
          choice = gets.chomp.to_i
        end
      when 9
        if game.grid[2][2] == " "
          Classes::Cell.new
          game.grid[2][2] = x_or_o
          good_response = true
        else
          puts "Please select an empty space!"
          choice = gets.chomp.to_i
        end
      else
        puts "Please pick a number from 1 to 9"
        choice = gets.chomp.to_i
      end
    end
  end
  until game.over?
    puts "Player 1's choice:"
    choice = gets.chomp.to_i
    cell_picker.call(choice, "X")
    game.display_board
    break if game.over?

    puts "Player 2's choice:"
    choice = gets.chomp.to_i 
    cell_picker.call(choice, "O")
    game.display_board
    break if game.over?
  end
end

run