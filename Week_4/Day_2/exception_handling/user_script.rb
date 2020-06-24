require_relative 'super_useful'

# puts "'five' == #{convert_to_int('five')}"

# feed_me_a_fruit

begin
    puts "Please enter a name"
    name = gets.chomp
    puts "Please enter a favorite pastime"
    fav_p = gets.chomp
    sam = BestFriend.new(name, 6, fav_p)
rescue FriendshipError => err
    puts "We're not bestfriends."
rescue InsufficientData => err_2  
    puts "Please enter valid name AND fav pastime"
    retry  
end 


sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
