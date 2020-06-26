require "deck"

describe Deck do

    describe "#initialize" do
        subject(:deck) { Deck.new }

        it "makes sure that the deck has 52 cards" do
            expect(deck.cards.length).to eq(52)
        end 

        it "has 13 cards of each suit" do
            suit_arr = ["spade", "heart", "diamond", "club"]
            suit_hash = Hash.new(0)
            deck.cards.each { |card| suit_hash[card.suit] += 1 }
            expect(suit_hash.values).to eq([13, 13, 13, 13])
        end

        it "has 4 cards of each number" do
            num_arr = (1..13).to_a
            num_hash = Hash.new(0)
            deck.cards.each { |card| num_hash[card.value] += 1 }
            arr = []
            13.times do 
                arr << 4 
            end 
            expect(num_hash.values).to eq(arr)
        end

    end
end