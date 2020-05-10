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

  def over?
    check_if_win
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
    self.grid[idx[0]][idx[1]] = marker
    Cell.new
  end

  private
  def check_if_win
    @rows = []
    @columns = []
    @diagonals = []
    # Populates array with row contents as strings
    3.times do |i|
      @rows << self.grid[i].join
    end
    # Populates array with column contents as strings
    3.times do |i|
      col_temp = []
      3.times do |j|
        col_temp << self.grid[j][i]
      end
      @columns << col_temp.join
    end
    # Populates array with diagonal contents as strings
    diag_temp = []
    3.times do |i|
      diag_temp << self.grid[i][i]
    end
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
