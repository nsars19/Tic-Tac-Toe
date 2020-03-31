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
  def initialize number
    @player_number = number
  end

  def choose_cell num 
    Cell.new(num, @player_number)
  end
end