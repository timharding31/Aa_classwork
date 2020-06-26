require "card"

describe Card do 
    subject(:new_card) { Card.new(12, "heart") }

    describe "#initialize" do 
        it "should set the correct value, symbol, and suit" do 
            expect(new_card.value).to eq(12)
            expect(new_card.symbol).to eq("Q")
            expect(new_card.suit).to eq("heart")
        end 
    end 
end
