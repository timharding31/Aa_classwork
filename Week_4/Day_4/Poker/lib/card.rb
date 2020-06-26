class Card
    attr_reader :value, :symbol, :suit

    SYMBOLS = { 
        1 => "A",  
        2 => "2", 
        3 => "3", 
        4 => "4", 
        5 => "5", 
        6 => "6", 
        7 => "7", 
        8 => "8", 
        9 => "9", 
        10 => "10", 
        11 => "J",
        12 => "Q",
        13 => "K",
    }
    
    def initialize(value, suit)
        raise "Card value must be between 1 and 13!" if !(1..13).include?(value)
        @value = value
        @symbol = SYMBOLS[value]
        @suit = suit
    end

end

