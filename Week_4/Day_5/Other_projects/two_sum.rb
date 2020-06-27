def two_sum?(nums, target)
    nums.each_with_index do |num, i|
        return true if (nums[0...i] + nums[i + 1..-1]).include?(target - num) 
    end
    false 
end

# p two_sum?([1,2,3,4], 100)

#7 
# i            j 
#[1 ,2 , 3, 4, 6, 7, 8, 9]

def two_sum_sorted(nums, target)
    nums.sort!
    i = 0
    j = nums.length - 1
    while i < j
        case nums[i] + nums[j] <=> target
        when 1
            j -= 1
        when -1
            i += 1
        else
            return true
        end
    end
    false
end

# p two_sum_sorted([34,2,2,4,3,3,43], 100)
# p two_sum_sorted([34,2,2,4,3,3,43], 47)

def two_sum_hash(nums, target)
    looking_for = {}
    nums.each do |num| 
        return true if looking_for[num] 
        looking_for[target - num] = true 
    end 
    false 
end

def three_sum(nums, target)
    looking_for = {}
    nums.each_with_index do |num, i|
        new_target = target - num
        return true if two_sum_hash(nums[i + 1..-1], new_target)
    end
    false
end

def n_sum(n, nums, target)
end


p two_sum_hash([34,2,2,4,3,3,43], 100)
p two_sum_hash([34,2,2,4,3,3,43], 6)
