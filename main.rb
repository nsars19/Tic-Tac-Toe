require './classes.rb'

def over?
  cell = Cell.chosen_cells
  # Horizontal win conditions
  return true if cell[1] == $player1 && cell[2] == $player1 && cell[3] == $player1
  return true if cell[1] == $player2 && cell[2] == $player2 && cell[3] == $player2
  return true if cell[4] == $player1 && cell[5] == $player1 && cell[6] == $player1
  return true if cell[4] == $player2 && cell[5] == $player2 && cell[6] == $player2
  return true if cell[7] == $player1 && cell[8] == $player1 && cell[9] == $player1
  return true if cell[7] == $player2 && cell[8] == $player2 && cell[9] == $player2
  # Vertical win conditions
  return true if cell[1] == $player1 && cell[4] == $player1 && cell[7] == $player1
  return true if cell[1] == $player2 && cell[4] == $player2 && cell[7] == $player2
  return true if cell[2] == $player1 && cell[5] == $player1 && cell[8] == $player1
  return true if cell[2] == $player2 && cell[5] == $player2 && cell[8] == $player2
  return true if cell[3] == $player1 && cell[6] == $player1 && cell[9] == $player1
  return true if cell[3] == $player2 && cell[6] == $player2 && cell[9] == $player2
  # Diagonal win conditions
  return true if cell[1] == $player1 && cell[5] == $player1 && cell[9] == $player1
  return true if cell[1] == $player2 && cell[5] == $player2 && cell[9] == $player2
  return true if cell[3] == $player1 && cell[5] == $player1 && cell[7] == $player1
  return true if cell[3] == $player2 && cell[5] == $player2 && cell[7] == $player2
  # Draw condition
  return true if cell.length == 9
  false
end

def run
  puts "Welcome to Tic Tac Toe!!"
  puts "Player 1!! What's your name?"
  $player1 = Player.new gets.chomp
  puts "Great!"
  puts "Player 2! How about your name?"
  $player2 = Player.new gets.chomp
  puts "Excellence. Let's get started then!"
  puts "You must choose a number for your selection. Each number corresponds with"
  puts "a spot on the grid, like so:\n\n"
  puts "1 | 2 | 3 "
  puts "----------"
  puts "4 | 5 | 6 "
  puts "----------"
  puts "7 | 8 | 9 \n\n"

  choice_proc = Proc.new do |name|
    good_response = false
    
    until good_response == true
      response = gets.chomp.to_i
      case response
      when 1
        name.choose_cell 1
        good_response = true
      when 2
        name.choose_cell 2
        good_response = true
      when 3
        name.choose_cell 3
        good_response = true
      when 4
        name.choose_cell 4  
        good_response = true
      when 5
        name.choose_cell 5
        good_response = true
      when 6
        name.choose_cell 6
        good_response = true
      when 7
        name.choose_cell 7
        good_response = true
      when 8 
        name.choose_cell 8
        good_response = true
      when 9
        name.choose_cell 9
        good_response = true
      else
        puts "Please choose a number between 1 and 9"
      end
    end
  end

  until over?
    puts "Player 1's choice: "
    choice_proc.call($player1)
    puts "Player 2's choice: "
    choice_proc.call($player2)    
  end
end

run

