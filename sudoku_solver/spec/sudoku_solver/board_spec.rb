require "spec_helper"

describe SudokuSolver do
  describe "a board" do
    context "a new board" do  
      before do
        @board = SudokuSolver::Board.new
      end
      it "should have all 0s" do
        @board.get(0,0).should equal(0)
        @board.get(8,8).should equal(0)
      end

      it "should not be bigger than 9 by 9" do
        lambda {@board.get(9,9)}.should raise_error(RuntimeError, "input outside of board")
      end

      it "should be writable" do
        @board.put(0,0,1)
        @board.get(0,0).should equal(1)
      end

      it "should not be able to write outside the board" do
        lambda {@board.put(9,9,1)}.should raise_error(RuntimeError, "input outside of board")
      end
    end

    context "a board with mutable pairs" do
      before do
        @board = SudokuSolver::Board.new
        @board.mutable_pairs.push([0,0])
        @board_children = @board.get_children()
      end

      it "should be able to return children" do
        @board_children.size.should == 9
      end

      it "should have all boards with the next value 1 through 9" do
        @board_children[0].get(0,0).should == 1
        
      end
    end

  end
end
