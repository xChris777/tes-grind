puts "Welcome to TES Grind, an unofficial The Elder Scrolls experience!"

puts "Please enter your name: "

name = gets.chomp.capitalize
#takes name from user input, assigns to variable, capitalizes it
puts
puts "#{name}, you are a prisoner on an Imperial prison ship, sailing somewhere along the outskirts of Tamriel."
puts
puts "You are unsure how you ended up here, as you have no recollection of the past few days. Even memories from prior are currently a hazy blur."
puts
puts "As you struggle to recall what led you to this moment, you hear a booming voice from the cell next to yours."
puts 
puts "'Hey, you there! The name's Rurik.....and you are?'"
puts 
puts "'Pleasure to meet ya', #{name}!'"
puts
puts "'Whereabouts are you from then?'"

pcorigin = gets.chomp.capitalize
#takes player origin from user input, assigns to variable, capitalizes it
  if pcorigin.downcase == "skyrim"
    puts
    puts "'Aha! A fellow Skyrim native! Hopefully we can talk about the homeland over a nice mug of spiced mead one day. If we live through this gods-forsaken mess, that is.'"
  else
    puts
    puts "'Ah, from  #{pcorigin} eh? I've never been there myself, but I've heard grand tales from my seafaring friends. I hope we live long enough to share them with ya'"
  end 

  puts
  puts "'Say, what class are you? I'm a bit of a thief myself, though I bet I look the fool considering I got myself locked up here. I'm not the quietest unfortunately, try as I might...'"
  pcclass = gets.chomp

if pcclass.downcase == "stealth archer" || pcclass.downcase == "thief" || pcclass.downcase == "assassin" || pcclass.downcase == "rogue"
  puts
  puts "'Nice, a #{pcclass.downcase}? Sneaky!!'"

elsif pcclass.downcase == "archer"
  puts
  puts "'Huh, an #{pcclass.downcase}? I think some precision fire will be very useful in our immediate future..'"

elsif pcclass.downcase == "warrior" || pcclass.downcase == "fighter" || pcclass.downcase == "knight"
  puts
  puts "'A #{pcclass.downcase}, eh? Strong type, I bet. Just the sort we need to get out of this mess.'"
elsif pcclass.downcase == "mage" || pcclass.downcase == "sorcerer" || pcclass.downcase == "wizard"
  puts
  puts "'Oh...a #{pcclass.downcase}? ....Well, I suppose brains over brawn has its merits in a situation like this. Just don't go zapping me accidentally, you hear?'"

else
  puts
  puts "'A #{pcclass.downcase}? That's a new one for me. Well, whatever you are, I hope it serves us well. We need to get off this blasted ship..'"
end 

  puts "Suddenly, the ship lurches violently, and you are thrown to the wall of your cell. "
