require_relative "Piece.rb"

class Board
  attr_accessor :rows
  
  def initialize
    @rows = Array.new(8){Array.new(8, NullPiece.new)}
    @sentinel = NullPiece.new
  end
  
  def move_piece(start_pos,end_pos)
    # p @rows[0, 0]
    # p @rows[start_pos[0]][start_pos[1]]
    if self[start_pos].is_a? NullPiece
      raise "There is no piece at this position!" 
    elsif self[start_pos].valid_move?(end_pos) == false
      raise "You cannot move there!"
    else
    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
      self[start_pos] = @sentinel
    end
  end
  
  def [](pos) 
    x, y = pos
    @rows[x][y]
  end
  
  def []=(pos,value)
    x, y = pos
    @rows[x][y] = value
  end
  
  def valid_move?(pos)
    board_indices = (0..7).to_a
    pos.all? {|idx|board_indices.include?(idx)}
  end
  
end
# 
def inspect
  @rows
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  
end




# 
# 
# board = Board.new
# 
# pos = [1,2]
# board[pos]
# 
# board[[1,2]]
# board[1,2]

