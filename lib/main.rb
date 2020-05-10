require './lib/classes.rb'

def run
  puts "Welcome to Tic Tac Toe!!\n"
  puts "You must choose a number for your selection. Each number corresponds with"
  puts "a spot on the grid, like so:\n\n"
  puts "1 | 2 | 3 "
  puts "----------"
  puts "4 | 5 | 6 "
  puts "----------"
  puts "7 | 8 | 9 \n\n"
  
  player1 = Player.new 
  player2 = Player.new 
  game = Board.new

  run_game = Proc.new do |player_num, marker|
    puts "Player #{player_num}'s choice:"
    choice = gets.chomp.to_i
    good_answer = false
    until good_answer
      if choice > 0 && choice <= 9
        game.choose_cell(choice, marker)
        good_answer = true
      else
        puts "Choose a number between 1 and 9"
        choice = gets.chomp.to_i
      end
    end
    game.display_board
  end

  until game.over?
    run_game.call(1, "X")
    break if game.over?
    run_game.call(2, "O")
    break if game.over?
  end
end

run