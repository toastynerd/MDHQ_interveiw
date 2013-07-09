module SudokuSolver
  class Solver
    def self.solve!(board)
      @distribution = SudokuSolver::Checker.get_distribution(board)
      #check for obviously unsolvable boards
      (1...10).each do |value|
        (1...10).each do |number|
          if @distribution[:columns][value][number] > 1
            return false
          end
          if @distribution[:rows][value][number] > 1
            return false
          end
          if @distribution[:blocks][value][number] > 1
            return false
          end
        end
      end
      child_queue = []
      child_queue.push(board)
      while !child_queue.empty?
        print "."
        $stdout.flush
        current = child_queue.pop
        if SudokuSolver::Checker.solved?(current)
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
