module SudokuSolver
  class Solver
    def self.solve!(board)
      child_queue = []
      child_queue.push(board)
      while !child_queue.empty?
        print "."
        $stdout.flush
        current = child_queue.pop
        if SudokuSolver::Checker.solved?(current)
          puts current
          return current
        else
          temp_boards = current.get_children
          unless temp_boards == false
            temp_boards.each do |child|
              child_queue.push(child)
            end
          end
        end
      end

      return false
    end

  end
end
