require './lib/classes'

describe "Board" do
  let(:game) { Board.new }
  
  describe "#over?" do
    it "returns false with no selections" do
      expect(game.over?).to eql false
    end

    it "returns false with some selections" do
      game.grid[0][1], game.grid[2][2], game.grid[1][1] = "X", "O", "X"
      expect(game.over?).to  eql false
    end

    ["X", "O"].each do |x_or_o|
      3.times do |i|
        it "returns true with #{x_or_o} in rows" do
          3.times { |j| game.grid[i][j] = "#{x_or_o}" } 
          expect(game.over?).to eql true
        end

        it "returns true with #{x_or_o} in columns" do
          3.times { |j| game.grid[j][i] = "#{x_or_o}" }
          expect(game.over?).to eql true
        end
      end

      it "returns true with #{x_or_o} in first diagonal" do
        3.times { |i| game.grid[i][i] = "#{x_or_o}" }
        expect(game.over?).to eql true
      end

      it "returns true with #{x_or_o} in second diagonal" do
        game.grid[0][2], game.grid[1][1], game.grid[2][0] = "#{x_or_o}", "#{x_or_o}", "#{x_or_o}"
        expect(game.over?).to eql true
      end
    end

    it "ends when board is full" do
      9.times { Cell.new }
      expect(game.over?).to eql true
    end
  end

  describe "#choose_cell" do
    it "does change from ' ' to 'X' or 'O'" do
      expect { game.choose_cell(3, 'X') }.to change { game.grid[0][2] }.from(' ').to('X')
    end

    xit "does not allow a previously chosen space to be selected" do
      game.grid[0][0] = 'X'
      expect { game.choose_cell(1, 'O') }.not_to change { game.grid[0][0] }
    end

    [10, -5].each do |number|
      it "calls itself again with number > 9 or < 0" do
        expect(game).to receive(:choose_cell)
        game.choose_cell(number, 'X')
      end
    end
  end
end