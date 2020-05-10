class Board
  attr_accessor :grid
  
  def initialize
    @rows = []
    @columns = []
    @diagonals = []
    @grid = [
              [" ", " ", " "],
              [" ", " ", " "],
              [" ", " ", " "]
            ]
  end

  def self.run
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

  def over?
    get_board
    [@rows, @columns, @diagonals].each do |e|
      for item in e
        return true if item == "XXX" || item == "OOO"
      end
    end
    return true if Cell.count == 9
    false
  end

  def display_board
    cell = self.grid
    puts "#{cell[0][0]} | #{cell[0][1]} | #{cell[0][2]}"
    puts "----------"
    puts "#{cell[1][0]} | #{cell[1][1]} | #{cell[1][2]}"
    puts "----------"
    puts "#{cell[2][0]} | #{cell[2][1]} | #{cell[2][2]}\n\n"
  end

  def choose_cell choice, marker
    options = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    idx = []
    options.each_with_index do |e, i|
      idx = [i, e.index(choice)] if e.include?(choice)
    end
    return make_new_choice(marker) if self.grid[idx[0]][idx[1]] != " "
    self.grid[idx[0]][idx[1]] = marker
    Cell.new
  end

  private
  def make_new_choice marker
    puts "Please select a spot that hasn't been chosen"
    choice = gets.chomp.to_i
    until choice > 0 && choice <= 9 
      choice = gets.chomp.to_i
    end
    choose_cell(choice, marker)
  end

  def get_board
    @rows = []
    @columns = []
    @diagonals = []
    # Populates array with row contents as strings
    3.times { |i| @rows << self.grid[i].join }
    # Populates array with column contents as strings
    3.times do |i|
      col_temp = []
      3.times { |j| col_temp << self.grid[j][i] }
      @columns << col_temp.join
    end
    # Populates array with diagonal contents as strings
    diag_temp = []
    3.times { |i| diag_temp << self.grid[i][i] }
    @diagonals << diag_temp.join
    @diagonals << "#{self.grid[0][2]}#{self.grid[1][1]}#{self.grid[2][0]}"
  end
end

class Cell
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end
end

class Player
end