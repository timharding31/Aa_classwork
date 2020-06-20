require_relative "./polyTreeNode/lib/00_tree_node.rb"
# PolyTreeNode
#   initialize(val)
#   #parent
#   #add_child
#   #remove_child
#   #dfs
#   #bfs

class KnightPathFinder
  attr_reader :root_node
  def self.valid_moves(pos)
    moves = []
    row, col = pos

    moves << [row + 2, col + 1]
    moves << [row + 1, col + 2]
    moves << [row - 1, col + 2]
    moves << [row - 2, col + 1]
    moves << [row - 2, col - 1]
    moves << [row - 1, col - 2]
    moves << [row + 1, col - 2]
    moves << [row + 2, col - 1]
    moves.select do |move|
      i = (0..7)
      i.include?(move[0]) && i.include?(move[1])
    end
  end

  #   def self.root_node(pos)
  #     PolyTreeNode.new(pos)
  #   end

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    build_move_tree
  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    new_positions = []
    valid_moves.each do |move|
      new_positions << move unless @considered_positions.include?(move)
    end
    @considered_positions.concat(new_positions)
    new_positions
  end

  def build_move_tree
    return nil if self.nil?

    discovered = [self.root_node]
    while !discovered.empty?
      curr_node = discovered.shift
      new_move_positions(curr_node.value).each do |move|
        child = PolyTreeNode.new(move)
        curr_node.add_child(child)
        discovered << child
      end
    end
    nil
  end

  def find_path(target)
    target_node = self.root_node.bfs(target)
    trace_path_back(target_node)
  end

  def trace_path_back(target_node)
    curr_node = target_node
    path = []
    until curr_node.parent.nil?
      path << curr_node.value
      curr_node = curr_node.parent
    end
    path << self.root_node.value
    path.reverse
  end
end

# kpf = KnightPathFinder.new([0, 0])
# kpf.build_move_tree
# p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# p kpf.find_path([6, 2]) # => [[0, 0], [2, 1], [3, 3]]
