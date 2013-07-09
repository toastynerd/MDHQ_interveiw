require 'spec_helper'

describe SudokuSolver do
  describe "board loader" do
    context "no file" do
      it "should raise an error" do
        lambda {@board = SudokuSolver::Loader.load_board("")}.should raise_error(RuntimeError, "no file specified")
      end
    end

    context "incorrectly sized cvs file" do
      it "should raise an error" do
        lambda {@board = SudokuSolver::Loader.load_board("boards/bad_board.csv")}.should raise_error(RuntimeError, "file did not contain a 9 by 9 sudoku board")
      end
    end

    context "a correct board" do
      before do
        @board = SudokuSolver::Loader.load_board("boards/good_board.csv")
      end

      it "should be successful" do
        @board.get(0,0).should == 1
      end

      it "should keep track of mutable pairs" do
        @board.mutable_pairs.should_not be_empty
      end
    end
  end

  describe "board writer" do

    context "it should write to a new csv file" do
      @board = SudokuSolver::Loader.load_board("boards/solved_board.csv")
      SudokuSolver::Loader.write_solution(@board)
      @board = SudokuSolver::Board.new
      @board = SudokuSolver::Loader.load_board("solution.csv")
      @board.get(0,0).should == 5 
    end
  end
end
