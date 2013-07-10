module SudokuSolver
  class Board
    attr_accessor :mutable_pairs
    attr_accessor :my_board_matrix
    def initialize(options = {})
      unless options.size == 2
        @my_board_matrix =                 [[0,0,0,0,0,0,0,0,0],
                                            [0,0,0,0,0,0,0,0,0],
                                            [0,0,0,0,0,0,0,0,0],
                                            [0,0,0,0,0,0,0,0,0],
                                            [0,0,0,0,0,0,0,0,0],
                                            [0,0,0,0,0,0,0,0,0],
                                            [0,0,0,0,0,0,0,0,0],
                                            [0,0,0,0,0,0,0,0,0],
                                            [0,0,0,0,0,0,0,0,0]]
        @mutable_pairs =  Array.new
      else
        @my_board_matrix = Marshal.load(Marshal.dump(options[:board_matrix]))
        @mutable_pairs =  Marshal.load(Marshal.dump(options[:mutable_pairs]))
      end
    end

    def clone
      Board.new({:board_matrix => @my_board_matrix.clone, :mutable_pairs => @mutable_pairs.clone})
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
        @distribution = SudokuSolver::Checker.get_distribution(self)
        current_pair = @mutable_pairs.pop()
        @boards = []
        (1...10).each do |number|
          unless @distribution[:columns][current_pair[0]][number] > 0 || @distribution[:rows][current_pair[1]][number] > 0 || @distribution[:blocks][@distribution[:block_values][current_pair[0]][current_pair[1]]][number]
            temp_board = self.clone 
            temp_board.put(current_pair[0],current_pair[1], number)
            @boards.push(temp_board)
          end
        end
        @boards
      else
        false
      end
    end

    def display
      @x = 0
      while @x < 10
        puts @my_board_matrix[@x]
        @x += 1
      end

    end

  end
end
