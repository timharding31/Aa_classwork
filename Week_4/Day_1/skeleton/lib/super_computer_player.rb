require_relative 'tic_tac_toe_node'
require_relative 'tic_tac_toe'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    new_node = TicTacToeNode.new(game.board, mark)
    not_losing_moves = []
    winning_moves = []
    new_node.children.each do |child|
      if child.winning_node?(mark)
        winning_moves << child.prev_move_pos 
      elsif !child.losing_node?(mark)
        not_losing_moves << child.prev_move_pos
      end
    end
    
    if winning_moves.length > 0  
      possible_moves = (winning_moves + not_losing_moves)
      p possible_moves
      return possible_moves.sample
    elsif not_losing_moves.empty?
      raise "I can't win or draw!, Sorry!"
    else
      return not_losing_moves.first
    end
  end
end

# [x, _, _]
# [o, o, _]
# [_, _, _]
# (blockable_win_game, :x)).to eq([1, 2])

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
