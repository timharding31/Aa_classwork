require "byebug"

def my_min(arr) 
    arr.each do |num| 
        return num if arr.all? { |num_2| num <= num_2 } 
    end 
end 

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def my_min_lin(arr) 
    arr.inject do |min, num| 
        if num < min  
            num  
        else  
            min  
        end  
    end 
end 

# p my_min_lin(list)  # =>  -5
#O(n^3)
def largest_contig_subsum(nums)
    max = nil
    nums.each_with_index do |num, i|
        j = i
        while j < nums.length
            if !max || nums[i..j].sum > max
                max = nums[i..j].sum
            end
            j += 1
        end
    end
    max
end
#largest_sum = 8
#current_sum = 8
#       i         j
list = [2, 3, -6, 7, -6, 7]
# p largest_contig_subsum(list) # => 8 (from [7, -6, 7])

def largest_contig_subsum_lin(nums)
    # debugger
    largest_sum = nums[0]
    current_sum = 0
    i, j, = 0, 0
    while j < nums.length  
        current_sum += nums[j] 
        
        if nums[j] > current_sum 
            i = j  
            current_sum = nums[j]
        end 

        largest_sum = current_sum if current_sum > largest_sum 

        j += 1
    end
    largest_sum
end

p largest_contig_subsum_lin(list) # => 8 (from [7, -6, 7])
p largest_contig_subsum_lin([-5,-1,-3, 7, 3, 3, 8, -20]) 

