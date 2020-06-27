def first_anagram?(str_1, str_2) 
    str_1_anagrams = str_1.split("").permutation.to_a  
    str_1_anagrams.map! { |ana| ana.join("") }
    str_1_anagrams.include?(str_2)
end

def second_anagram?(str_1, str_2)
    str_1.each_char do |char|
        index = str_2.index(char)
        return false if index.nil?
        str_2[index] = ""
    end
    str_2.empty?
end

def third_anagram?(str_1, str_2) 
    str_1.split("").sort == str_2.split("").sort 
end 

def fourth_anagram?(str_1, str_2)
    counter = Hash.new(0)
    str_1.each_char do |char|
        counter[char] += 1
    end
    str_2.each_char do |char|
        counter[char] -= 1
    end
    counter.values.all? { |val| val == 0 }
end

