def my_uniq(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    hash.keys
end

class Array
    def two_sum
        out_arr = []
        (0...self.length).each do |idx_1|
            (idx_1 + 1...self.length).each do |idx_2|
                out_arr << [idx_1, idx_2] if self[idx_1] + self[idx_2] == 0
            end
        end
        out_arr
    end
end

def my_transpose(arr)
    arr_out = Array.new(arr[0].length) { Array.new(arr.length) }
    arr.each_with_index do |row, row_i|
        row.each_with_index do |ele, ele_i|
            arr_out[ele_i][row_i] = ele
        end
    end
    arr_out
end

def stock_picker(arr)
    idx_array = [0, 0]
    max_dif = 0
    (0...arr.length).each do |idx_1|
        (idx_1 + 1...arr.length).each do |idx_2|
            if arr[idx_2] - arr[idx_1] > max_dif 
                max_dif = arr[idx_2] - arr[idx_1]
                idx_array = [idx_1, idx_2]
            end 
        end 
    end 
    max_dif == 0 ? nil : idx_array
end

class Towers_of_Hanoi
attr_reader :stacks 
    def initialize
        @stacks = [[3, 2, 1], [], []]
        @ele = @stacks[0].dup
    end

    def move(pile_1, pile_2)
        pile_1 -= 1
        pile_2 -= 1
        if @stacks[pile_2].empty? || @stacks[pile_2][-1] > @stacks[pile_1][-1]
            @stacks[pile_2] << @stacks[pile_1].pop
        else
            raise "Discs must be placed in ascending order!"
        end
    end

    def run
        while !won?(@stacks)
            begin
                @stacks.each_with_index { |stack, i| p "Stack #{i+1}: #{stack} " }
                puts "Input your stack indices (e.g. '1 3')"
                input = gets.chomp.split.map!(&:to_i)
                self.move(input[0], input[1])
                break if won?(@stacks)
                system("clear")
            rescue
                system("clear")
                puts "Discs must be placed in ascending order!"
                sleep(3)
                self.run
            end
        end
        puts "You won!"
    end

    def won?(stacks_arr)
        return true if stacks_arr[2] == @ele
        false
    end

end

# towers = Towers_of_Hanoi.new
# towers.run

