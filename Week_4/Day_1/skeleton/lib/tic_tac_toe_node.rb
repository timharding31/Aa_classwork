require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over? 
      if @board.won?
        return true if @board.winner != evaluator
        return false if @board.winner == evaluator 
      elsif @board.tied?   
        return false
      end 
    end 
     

    if next_mover_mark == evaluator  
      self.children.all? do |child| 
        child.losing_node?(evaluator) #
      end
    else  
      self.children.any? do |child| 
        child.losing_node?(evaluator)
      end
    end 

  end

  def winning_node?(evaluator)

    if @board.won?
      return true if @board.winner == evaluator
      return false if @board.winner != evaluator 
    elsif @board.over? 
      return false  
    end 

    if next_mover_mark == evaluator  
      self.children.any? do |child| 
        child.winning_node?(evaluator) #
      end
    else  
      self.children.all? do |child| 
        child.winning_node?(evaluator)
      end
    end 

  end

  def children
    res = []
    new_next_mark = @next_mover_mark == :x ? :o : :x

    @board.rows.each_with_index do |row, i|
      row.each_with_index do |square, j|
        next_pos = [i, j]
        if @board.empty?(next_pos)
          next_board = @board.dup 
          next_board[next_pos] = @next_mover_mark
          current = TicTacToeNode.new(next_board, new_next_mark, next_pos)
          res << current
        end
      end
    end
    res
  end
end
