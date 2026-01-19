puts "Welcome to TES Grind, an unofficial The Elder Scrolls experience!"

puts "Please enter your name: "

name = gets.chomp
#takes name from user input, assigns to variable
puts
puts "Hello #{name}. You are a prisoner on an Imperial prison ship, sailing along the outskirts of Tamriel. "
puts "You are unsure how you ended up here, as you have no recollection of the past few days. "
puts "As you struggle to recall what led you to this moment, you hear a booming voice from the cell next to yours. "
puts 
puts "'Hey, you there! Whereabouts are you from then?'"

pcorigin = gets.chomp

  if pcorigin.downcase == "skyrim"
    puts
    puts "Aha! A fellow Skyrim native! Hopefully we can talk about the homeland over a nice mug of spiced mead one day. If we live through this gods-forsaken mess, that is."
  else
    puts
    puts "Ah, from  #{pcorigin} eh? I've never been there myself, but I've heard grand tales from my seafaring friends. I hope we live long enough to share them with ya'"
  end 

  puts
  puts "Say, what class are you? I'm a bit of a sneak myself, though I bet I look the fool considering I got myself locked up here. Not exactly the most quiet thief unfortuntately...'"
  pcclass = gets.chomp

if pcclass.downcase == "sneak" || pcclass.downcase == "thief" || pcclass.downcase == "assassin"
  puts
  puts "Huh, a #{pcclass.downcase}? Another similarity!"

elsif pcclass.downcase == "warrior" || pcclass.downcase == "fighter" || pcclass.downcase == "knight"
  puts
  puts "A #{pcclass.downcase}, eh? Strong type, I bet. Just the sort we need to get out of this mess."
elsif pcclass.downcase == "mage" || pcclass.downcase == "sorcerer" || pcclass.downcase == "wizard"
  puts
  puts "Oh, a #{pcclass.downcase}? Well, I suppose brains over brawn has its merits in a situation like this. Just don't go zapping me accidentally, you hear?"

else
  puts
  puts "A #{pcclass.downcase}? That's a new one for me. Well, whatever you are, I hope it serves us well in the shitstorm ahead."
end