#max 6
#min 3
#range = [1, 3] 
#4 3 4 6 7 8
#    [   ]

def windowed_max_range(arr, win_size)
    i = 0
    current_max_range = nil
    while i + win_size - 1 < arr.length
        window = arr[i...(i + win_size)]
        mini= window.min()
        maxi = window.max()
        current_max_range = (maxi - mini) if !current_max_range || (maxi - mini) > current_max_range
        i += 1
    end
    current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue 
    def initialize 
        @queue = [] 
    end 

    def enqueue(ele)
        @queue << ele
    end 

    def dequeue
        @queue.shift
    end 

    def peek 
        @queue[0]
    end 

    def empty? 
        @queue.empty? 
    end 

    def size
        @queue.length  
    end 
end

class MyStack
    def initialize 
        @stack = [] 
    end 

    def push(ele)
        @stack << ele
    end 

    def pop
        @stack.pop
    end 

    def peek 
        @stack[-1]
    end 

    def empty? 
        @stack.empty? 
    end 

    def size
        @stack.length  
    end 
end

class StackQueue
    def initialize
        @pusher = Stack.new
        @popper = Stack.new
    end

    def enqueue
        @pusher.push
    end

    def dequeue
        # until @pusher.empty?
        # end
    end
end

