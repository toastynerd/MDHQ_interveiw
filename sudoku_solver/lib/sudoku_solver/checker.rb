module SudokuSolver
  class Checker
    def self.solved?(board)
      #an array to look up which x,y values correspond
      #to each block
      @block_values = [[1,1,1,2,2,2,3,3,3],
                       [1,1,1,2,2,2,3,3,3],
                       [1,1,1,2,2,2,3,3,3],
                       [4,4,4,5,5,5,6,6,6],
                       [4,4,4,5,5,5,6,6,6],
                       [4,4,4,5,5,5,6,6,6],
                       [7,7,7,8,8,8,9,9,9],
                       [7,7,7,8,8,8,9,9,9],
                       [7,7,7,8,8,8,9,9,9]]

      #each array will have [i][j] where i is equal to the 
      #row, column or block number and j is equal to the 
      #a number 1 through 9, value will be the number of times
      #that item is present in variable board
      @columns =        [[0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0]]

      @rows =           [[0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0]]

      @blocks =         [[0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0,0]]
      @x = 0
      while @x < 9
        @y = 0
        while @y < 9
          unless board.get(@x,@y) == '-'
            @columns[@x][board.get(@x,@y)] += 1
            @rows[@y][board.get(@x,@y)] += 1
            @blocks[@block_values[@x][@y]][board.get(@x,@y)] += 1
          else
            return false
          end
          @y += 1
        end
        @x += 1
      end

      @columns.each do |row|
        row.each do |value|
          if value > 1
            return false
          end
        end
      end

      @rows.each do |row|
        row.each do |value|
          if value > 1
            return false
          end
        end
      end

      @blocks.each do |row|
        row.each do |value|
          if value > 1
            return false
          end
        end
      end
      true

    end
  end
end
