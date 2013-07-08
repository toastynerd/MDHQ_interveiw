module SudokuSolver
  class Board
    attr_accessor :mutable_pairs
    attr_accessor :my_board_matrix
    def initialize(options = {})
      @my_board_matrix = options[:board_matrix] || [[0,0,0,0,0,0,0,0,0],
                                          [0,0,0,0,0,0,0,0,0],
                                          [0,0,0,0,0,0,0,0,0],
                                          [0,0,0,0,0,0,0,0,0],
                                          [0,0,0,0,0,0,0,0,0],
                                          [0,0,0,0,0,0,0,0,0],
                                          [0,0,0,0,0,0,0,0,0],
                                          [0,0,0,0,0,0,0,0,0],
                                          [0,0,0,0,0,0,0,0,0]]
      @mutable_pairs = options[:mutable_pairs] || Array.new
    end

    def clone
      SudokuSolver::Board.new({:board_matrix => @my_board_matrix.clone, :mutable_pairs => @mutable_pairs.clone})
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

    def get_children
      unless @mutable_pairs.empty?
        current_pair = @mutable_pairs.pop()
        @boards = []
        (1...10).each do |number|
          temp_board = self.clone 
          temp_board.put(current_pair[0],current_pair[1], number)
          @boards.push(temp_board)
        end
        @boards
      else
        false
      end
    end

  end
end
