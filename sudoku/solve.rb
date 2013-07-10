#!/usr/bin/env ruby
require_relative "lib/sudoku_solver"
if ARGF
  @board = SudokuSolver::Loader.load_board(ARGF)
  @board = SudokuSolver::Solver.solve!(@board)
  if @board == false
    puts "A solution could not be found"
  else
    SudokuSolver::Loader.write_solution(@board)
  end
else 
  if ARGF.argv[0] == "-b"
      @board = SudokuSolver::Loader.load_board(ARGF.argv[1])
    @board = SudokuSolver::Solver.solve!(@board)
    if @board == false
      puts "A solution could not be found"
    else
      SudokuSolver::Loader.write_solution(@board)
    end
  else
  puts 'Did no specify a file.'
  end
end
