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

  run_game = Proc.new do |player_num, marker|
    puts "Player #{player_num}'s choice:"
    choice = gets.chomp.to_i
    game.choose_cell(choice, marker)
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