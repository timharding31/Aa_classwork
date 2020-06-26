require_relative "./deck.rb"

class Hand
    attr_reader :points

    def initialize(hand_arr) 
        @hand_arr = hand_arr
        @suit_hash = Hash.new(0)
        @hand_arr.each { |card| @suit_hash[card.suit] += 1 }
        @set_hash = Hash.new(0)
        @hand_arr.each { |card| @set_hash[card.value] += 1 }
        @points = self.determine_points
    end

    def determine_points
        if self.straight_flush
            return 9
        elsif self.four_of_kind
            return 8
        elsif self.full_house 
            return 7
        elsif self.flush 
            return 6
        elsif self.straight 
            return 5
        elsif self.three_of_kind 
            return 4
        elsif self.two_pair
            return 3
        elsif self.pair
            return 2
        else 
            return 1
        end
    end

    def straight_flush
        if @suit_hash.keys.length == 1 && self.straight
            return true
        end
        false
    end 

    def four_of_kind
        if @set_hash.values.include?(4)
            return true
        end
        false 
    end

    def full_house 
        if @set_hash.values.length == 2 && @set_hash.values.include?(3)
            return true
        end
        false
    end 

    def flush
        if @suit_hash.keys.length == 1
            return true
        end
        false
    end

    def straight
        temp_keys = @set_hash.keys.sort 
        (0...(temp_keys.length-1)).each do |i| #nice
            if temp_keys[i] + 1 != temp_keys[i + 1] #lol
                return false
            end
        end
        true#hmmm
    end

    def three_of_kind 
        @set_hash.values.include?(3)
    end 

    def two_pair 
        counter = 0 
        @set_hash.values.each { |value| counter += 1 if value == 2 } 
        counter == 2 
    end 

    def pair 
        counter = 0 
        @set_hash.values.each { |value| counter += 1 if value == 2 } 
        counter == 1
    end 

end

# first = Card.new(1, "hearts")
# second = Card.new(2, "hearts")
# third =  Card.new(3, "hearts")
# fourth = Card.new(4, "hearts")
# fifth = Card.new(5, "hearts") 
# cards = [first, second, third, fourth, fifth] 
# temp_hand = Hand.new(cards)
# p temp_hand.determine_points