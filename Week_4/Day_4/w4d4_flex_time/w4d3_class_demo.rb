# Public, private, protected - ways of access control, not security; focuses more on the interface 
    # for other developers so they know which methods are used internally only vs available to public



class Parent
    def initialize(name)
        @name = name
    end

    def test
        whisper
    end

    private
    def whisper
        "shhhhhh"
    end

    protected 
    def yell
        "I'M YELLING"
    end
end

module Orphan
    def walk
        puts "walking"
    end
end 

class Child < Parent
    # include Orphan
    prepend Orphan

    def initialize(name, age)
        super(name) 
        @age = age
    end


    def scream
        # self.yell
        yell
    end

    def talk
        # self.whisper 
        whisper
    end

    def parent_yell
        p = Parent.new("Vanessa")
        p.yell
    end

    def walk
        puts 'not walking'
        super
    end

end


child = Child.new("Leo", 1)
parent = Parent.new("Andy")

# Q: what happens when you call Parent#whisper?
# p parent.whisper

# Q: what happens when you call Parent#yell?
# p parent.yell
# p parent.test

# Q: what happens when you call Child#scream with explicit receiver?
# p child.scream  

# Q: what happens when you call Child#scream with implicit receiver?
# p child.scream


# Q: what happens when you call Child#talk with explicit receiver?
# p child.talk

# Q: what happens when you call Child#talk with with implicit receiver?
# p child.talk

# Q: what happens when you call Child#parent_yell?
# p child.parent_yell

#------modules-----
p Child.ancestors

#------include module------
# Q: what happens when you call child#walk without super?
# p child.walk
# p Child.ancestors

# Q: with call to super, what happens when you call child#walk?
# p child.walk
# p Child.ancestors

#------prepend module------
# Q: what happens when you call child#walk without super?
p child.walk
# p Child.ancestors

# Q: with call to super, what happens when you call child#walk?
# p child.walk
# p Child.ancestors
