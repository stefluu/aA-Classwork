require_relative "Board.rb"

class Piece
  attr_reader :val
  
  def initialize(val)
    @valid_moves = []
    @val = val
  end
  
  def valid_move?(end_pos)
    true
    #some list of valid ones, and check if the pos is there. return bool
  end
  
  def inspect
    self.val.colorize()
  end
  
  def moves;end
  
end

class NullPiece < Piece
  def initialize
    @val = "N"
  end
end
