module Classes
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
      3.times do |i|
        return true if @rows[i]      == "XXX" || @rows[i]      == "OOO"
        return true if @columns[i]   == "XXX" || @columns[i]   == "OOO"
        return true if @diagonals[i] == "XXX" || @diagonals[i] == "OOO"
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

    def self.chosen_cells
      @@chosen_cells
    end

    def self.count
      @@count
    end
  end

  class Player
    attr_reader :name

    def initialize name
      @name = name
    end

    def choose_cell num 
      case num
      when 1 || 2 || 3
        Cell.new
        
      end
    end
  end
end

