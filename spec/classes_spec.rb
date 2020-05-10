require './lib/classes'

describe "Board" do
  let(:game) { Board.new }
  
  describe "#over?" do
    it "returns false without 'XXX or 'OOO" do
      expect(game.over?).to eql false
    end

    ["X", "O"].each do |letter|
      3.times do |i|
        it "returns true with #{letter} in rows" do
          3.times { |j| game.grid[i][j] = "#{letter}" } 
          expect(game.over?).to eql true
        end

        it "returns true with #{letter} in columns" do
          3.times { |j| game.grid[j][i] = "#{letter}" }
          expect(game.over?).to eql true
        end
      end

      it "returns true with #{letter} in first diagonal" do
        game.grid[0][0], game.grid[1][1], game.grid[2][2] = "#{letter}", "#{letter}", "#{letter}"
        expect(game.over?).to eql true
      end

      it "returns true with #{letter} in second diagonal" do
        game.grid[0][2], game.grid[1][1], game.grid[2][0] = "#{letter}", "#{letter}", "#{letter}"
        expect(game.over?).to eql true
      end
    end
  end
end