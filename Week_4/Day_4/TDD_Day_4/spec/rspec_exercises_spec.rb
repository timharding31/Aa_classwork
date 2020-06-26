require "rspec_exercises"

describe "my_uniq" do  
    it "returns values without duplicates" do  
        arr = [1, 2, 1, 3, 3]
        expect(my_uniq(arr)).to eq(arr.uniq)
    end 
end

describe "two_sum" do
    it "returns indices of number pairs that sum to zero" do
        arr = [-1, 0, 2, -2, 1]
        result = [[0, 4], [2, 3]]
        expect(arr.two_sum).to eq(result)
    end
end

describe "my_transpose" do 
    it "should switch rows and cols" do 
        arr = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
        result =  [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
        expect(my_transpose(arr)).to eq(arr.transpose)
    end 
end 

describe "stock_picker" do
    it "should return the buying/selling dates that result in highest profit" do
        price_arr = [2, 1, 3, 4, 7, 5]
        result = [1, 4]
        expect(stock_picker(price_arr)).to eq(result)
    end
end

describe Towers_of_Hanoi do
    subject(:hanoi_game) { Towers_of_Hanoi.new }
    
    describe "#move" do
        it "moves discs according to input" do
            input = [1, 3]
            hanoi_game.move(input[0], input[1])
            expected = [[3, 2], [], [1]]
            expect(hanoi_game.stacks).to eq(expected)
        end

        it "does not allow you to place a bigger disc on a smaller one" do
            input = [1, 3]
            hanoi_game.move(input[0], input[1])
            expect{ hanoi_game.move(input[0], input[1]) }.to raise_error("Discs must be placed in ascending order!")
        end
    end

    describe "#won?" do
        it "determines when a game is won" do
            expect(hanoi_game.won?( [[], [], [3, 2, 1]] )).to eq(true)
        end
    end
end



