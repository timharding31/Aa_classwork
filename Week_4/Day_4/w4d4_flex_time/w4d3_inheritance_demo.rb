class Animal # Q: How many methods are available for an animal instance?
    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
    end 

    def talk
        "blah blah"
    end

    def eat
        "I can eat"
    end
end

class Dog < Animal # Q: How many methods are available for a dog instance?
    attr_reader :size

    def initialize(name, age, size)
        super(name, age)
        @size = size
    end

    def bark
        "bark bark"
    end 

end 

class Pupper < Dog # Q: How many methods are available for a pupper instance?
    def initialize(name, age)
        super(name, age, "small")
    end  

    def cry
        "weeeeee"
    end

    def play
       "play with me"
    end
end 

parent = Animal.new("parent", 50)
doggie = Dog.new("doggie", 3, "big")
puppy = Pupper.new("puppy", 1)

p (Animal.instance_methods - Object.instance_methods).count
p (Dog.instance_methods - Object.instance_methods).count    
p (Pupper.instance_methods - Object.instance_methods).count 

