require_relative "./card.rb"

class Deck
    attr_reader :cards

    def initialize
        @cards = [] 
        self.populate_deck
    end 

    def populate_deck
        suit_arr = ["spade", "heart", "diamond", "club"]
        suit_arr.each do |suit| 
            (1..13).each do |value|
                @cards << Card.new(value, suit)
            end
        end
    end

end

