require 'csv'
module SudokuSolver
  class Loader
    def self.load_board(file_name)
      unless file_name.empty?
        @board = SudokuSolver::Board.new
        @y = 0 
        CSV.foreach(file_name) do |row|
          @x = 0
          row.each do |item|
            unless item == "-"
              @board.put(@x,@y,item.to_i)
            else
              @board.put(@x,@y,0)
              @board.mutable_pairs.push([@x,@y])
            end
            @x += 1
          end
          @y += 1
        end

        if @x == 9 && @y == 9
          return @board
        else
          raise "file did not contain a 9 by 9 sudoku board"
        end
      else
        raise "no file specified" 
      end
    end

    def self.write_solution(board)
      CSV.open("solution.csv", "wb") do |csv|
        board.my_board_matrix.each do |row|
          csv << row
        end
      end

    end
  end
end
