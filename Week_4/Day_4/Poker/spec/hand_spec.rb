require "hand"
require "card"

describe Hand do 
    
    describe "#determine_points" do

        it "correctly identifies a straight flush" do
            first = Card.new(1, "hearts")
            second = Card.new(2, "hearts")
            third =  Card.new(3, "hearts")
            fourth = Card.new(4, "hearts")
            fifth = Card.new(5, "hearts") 
            #now it's a different issue 
            cards = [first, second, third, fourth, fifth] 
            temp_hand = Hand.new(cards)
            expect(temp_hand.determine_points).to eq(9)
        end
        it "correctly identifies a full house" do
            hand = Hand.new([Card.new(2, "heart"), Card.new(2, "diamond"), Card.new(2, "spade"), Card.new(3, "spade"), Card.new(3, "heart")])
            expect(hand.determine_points).to eq(7)
        end
    end 
    
end 
#nice
=begin
-initialize with 5 cards as input, maybe as an array of those cards 
- have cases for straight flush, 4-of-a-kind, full house, flush, straight, 3-of-a-kind, 2 pairs, pair, high card
- compute score for the hand 
=end