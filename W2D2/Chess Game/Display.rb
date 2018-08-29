require 'colorize'
require "byebug"
require_relative 'Board.rb'
require_relative "Piece.rb"

class Display
  def initialize(board, cursor_pos)
    @board = board
    @cursor_pos = cursor_pos
    # @cursor_pos.colorize(:green).colorize(:background => :white)
  end
  
  def render
    system("clear")
    @board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |col_pos, col_idx|
        if row_idx == @cursor_pos[0] && col_idx == @cursor_pos[1]
          print " * ".colorize(:color => :black, :background => :green)
        elsif row_idx.even? && col_idx.even? || row_idx.odd? && col_idx.odd?
          print "   ".colorize(:color => :black, :background => :red)
        else
          print "   ".colorize(:color => :blue, :background => :white)
        end
      end
      puts
    end
    return nil
  end
  
  def inspect
    puts @board.rows
  end
  
end