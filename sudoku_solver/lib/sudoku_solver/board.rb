module SudokuSolver
  class Board
    def initialize
      @my_board_matrix = [[0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0],
                         [0,0,0,0,0,0,0,0,0]]
    end

    def get(x,y)
      unless x > 8||y > 8 
        @my_board_matrix[x][y]
      else
        raise "input outside of board"
      end
    end

    def put(x,y,value)
      unless x> 8 || y > 8
        @my_board_matrix[x][y] = value
      else
        raise "input outside of board"
      end
    end

  end
end