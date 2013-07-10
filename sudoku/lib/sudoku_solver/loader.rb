require 'csv'
module SudokuSolver
  class Loader
    def self.load_board(file_name)
      @board = SudokuSolver::Board.new
      @lines = []
      if file_name == ARGF
        ARGF.readlines.each do |line|
          line.split(',').each do |item|
            @lines << item
          end
        end 
      else
        if file_name.empty?
          raise "no file specified"
        end
        CSV.foreach(file_name) do |row|
          row.each do |item|
            @lines << item
          end
        end
      end
        @x = 0
        @y = 0
        @lines.each do |item| 
          if item == "-" || item == "-,"
            item = 0
            @board.mutable_pairs << [@x,@y]
          end
          @board.put(@x,@y,item.to_i)
          @x += 1
          if @x > 8
            @x = 0
            @y += 1
          end
        end

        if @y == 9
          return @board
        else
          raise "file did not contain a 9 by 9 sudoku board"
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
