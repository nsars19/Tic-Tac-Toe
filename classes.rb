module Classes
  class Cell
    @@chosen_cells = {}

    def initialize number, player
      @number = number
      @@chosen_cells[number] = player
    end

    def self.chosen_cells
      @@chosen_cells
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