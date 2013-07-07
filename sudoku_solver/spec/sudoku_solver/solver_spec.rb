require "spec_helper"

describe SudokuSolver do
  describe "sudoku solver" do
    context "solvable board" do
      it "should be solvable" do
        @board = SudokuSolver::Loader.load_board("boards/unsolved_board.csv")
        SudokuSolver::Checker.solved?(@board).should_not be_true
        SudokuSolver::Solver.solve!(@board)
        SudokuSolver::Checker.solved?(@board).should be_true
      end
    end

    context "unsolvable board" do
      it "should not be solvable" do
        @board = SudokuSolver::Loader.load_board("boards/unsolvable_board.csv")
        SudokuSolver::Checker.solved?(@board).should_not be_true
        SudokuSolver::Solver.solve!(@board).should_not be_true 
        SudokuSolver::Checker.solved?(@board).should_not be_true 
      end 
    end
  end
end
