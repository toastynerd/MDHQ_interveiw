require_relative "lib/sudoku_solver"
if ARGF.argv[0] == "-b"
  @board = SudokuSolver::Loader.load_board(ARGF.argv[1])
  @board = SudokuSolver::Solver.solve!(@board)
  if @board == false
    puts "A solution could not be found"
  else
    SudokuSolver::Loader.write_solution(@board)
  end
else 
  puts 'please a specify a board with -b "<board>"'
end
