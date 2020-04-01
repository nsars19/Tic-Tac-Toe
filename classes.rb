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

    private
    def check_results
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

    def over?
      return true if @rows == "XXX" || @rows == "OOO"
      return true if @columns == "XXX" || @columns == "OOO"
      return true if @diagonals == "XXX" || @diagonals == "OOO"
      return true if Cell.count == 9
    end
  end

  class Cell
    @@chosen_cells = {}
    @@count = 0

    def initialize number, player
      @number = number
      @@chosen_cells[number] = player
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
    def initialize name
      @name = name
    end

    def choose_cell num 
      Cell.new(num, @name)
    end
  end
end

