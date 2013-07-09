require 'spec_helper'

describe SudokuSolver do
  describe "solution checker" do
    context "correct board" do
      it "should return true" do
        @board = SudokuSolver::Loader.load_board("boards/solved_board.csv")
        SudokuSolver::Checker.solved?(@board).should be_true
      end
    end

    context "unsolved board" do
      it "should return false" do
        @board = SudokuSolver::Loader.load_board("boards/unsolved_board.csv")
        SudokuSolver::Checker.solved?(@board).should_not be_true
      end
    end

    context "incorrect board" do
      it "should return false" do
        @board = SudokuSolver::Loader.load_board("boards/incorrect_board.csv")
        SudokuSolver::Checker.solved?(@board).should_not be_true
      end
    end
  end
  
  describe "get distribution" do
    before do
      @board = SudokuSolver::Loader.load_board("boards/solved_board.csv")
      @distribution = SudokuSolver::Checker.get_distribution(@board)
    end

    it "should return an accurate column distribution" do
      @distribution[:columns][1][1].should equal(1)
    end

    it "should return an accurate row distribution" do
      @distribution[:rows][1][1].should equal(1)
    end

    it "should return an accurate block distribution" do
      @distribution[:blocks][1][1].should equal(1)
    end
  end
end
