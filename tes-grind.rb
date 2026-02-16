=begin
METHOD TESTS: 
example of a method 
 def woodcutting 
      puts "You begin to chop a tree"
      loop do
        puts "Chop chop chop.."
        woodcuttingXP += 2 
        charXP += 5 
        wood += 3
        #woodcutting level up system
        if woodcuttingXP >= 100
          woodcuttingLevel += 1
          puts "You have reached level #{woodcuttingLevel}!"
          woodcuttingXP = 0
        end
        #character level up system
        if charXP >= 1000
          charLevel += 1
          puts "You have reached level #{charLevel}!"
          charXP = 0
        end

        sleep(1)
        if IO.select([STDIN], nil, nil, 0)
          STDIN.gets
          puts "You have #{wood} pieces of wood"
          puts "You have achieved level #{woodcuttingLevel} woodcutting"
          puts "You have #{charXP} experience points"
          break
        end
      end 
end

another method
  def dialogue_pause
  sleep(text_delay)
  puts
  end

another method

def main_menu
  loop do
    
puts "
Main Menu
  1. Woodcutting
  2. Placeholder
  3. Exit
"
selection = gets.chomp.strip

if selection == "1" || selection == "1."
  puts "Press Enter to return to the main menu"
end
end
=end

#link to player.rb file
require_relative 'player'
@player = Player.new

#ACTIVE METHODS
#dialogue delay
def dialogue_pause(delay_time)
  sleep(delay_time)
  puts
end

def main_menu
  loop do
    
    puts "
    Main Menu
      1. Woodcutting
      2. Mining
      3. Exit
    "
    selection = gets.chomp.strip
  
    if selection == "1" || selection == "1."
        @player.woodcutting_skill
    elsif selection == "2" || selection == "2."
        @player.mining_skill
    elsif selection == "3" || selection == "3."
        puts "Goodbye!"
        dialogue_pause(@text_delay)
        exit
    else puts "Please input a numerical menu option."
    end
end
end


def skill_menu 
  
end





#BEGINNING OF GAME 
#intro conversation / getting player name, origin, class and dev mode (if dev is entered as name)
puts "Welcome to TES Grind, an unofficial The Elder Scrolls experience!"

puts "Please enter your name: "

#sets text delay variables
@text_delay = 1.5
@text_delay_slow = 3

dev_mode = false

#checks if name entered is Dev or dev and activates dev mode which currently speeds up text delivery but 
#will be used for additional testing in the future
name = gets.chomp.capitalize
if name == "Dev"
  dev_mode = true
  puts "Dev mode has been activated."
  puts "Name?"
  name = gets.chomp.capitalize.strip
  @text_delay = 0.2
elsif name == "Dev2"
    dev_mode = true
    puts "Dev mode 2 has been activated."
    name = "Chris"
    pcorigin = "Skyrim"
    pcclass = "Warrior"
    @text_delay = 0.2
end
 

#takes name from user input, assigns to variable, capitalizes it
if name == "Josie" || name == "Jos" || name == "Sicilian Baby" || name == "Josephine"
  puts "Hello my beautiful wife! Thanks for testing this game for me :) Love you!"
elsif name == "Emmy" || name == "Emilia" || name == "Em" 
  puts "Hello my beautiful child! Thanks for testing this game for me! :) Love you!"
end

dialogue_pause(@text_delay)
puts "#{name}, you are a prisoner on an Imperial prison ship, sailing somewhere along the outskirts of Tamriel."
dialogue_pause(@text_delay)
puts "You are unsure how you ended up here, as you have no recollection of the past few days. Even memories from prior are currently a hazy blur."
dialogue_pause(@text_delay)
puts "As you struggle to recall what led you to this moment, you hear a booming voice from the cell next to yours."
dialogue_pause(@text_delay)
puts "'Hey, you there! The name's Rurik.....and you are?'"
puts "..."
dialogue_pause(@text_delay)
puts "'Pleasure to meet ya', #{name}!'"
dialogue_pause(@text_delay)
puts "'Whereabouts are you from then?'"

#takes player origin from user input, assigns to variable, capitalizes it
pcorigin = gets.chomp.capitalize.strip

  if pcorigin.downcase == "skyrim"
    dialogue_pause(@text_delay)
    puts "'Aha! A fellow Skyrim native! Hopefully we can talk about the homeland over a nice mug of spiced mead one day. If we live through this gods-forsaken mess, that is.'"
  else
    dialogue_pause(@text_delay)
    puts "'Ah, from  #{pcorigin} eh? I've never been there myself, but I've heard grand tales from my seafaring friends. I hope we live long enough to share them with ya'"
  end 

  dialogue_pause(@text_delay)
  puts "'Say, what class are you? I'm a bit of a thief myself, though I bet I look the fool considering I got myself locked up here. I'm not the most quiet person unfortunately, try as I might...'"

  #takes player class from user input, assigns to variable
  pcclass = gets.chomp.capitalize.strip 

#this if/else statement gives different responses from Rurik depending on your class
if pcclass.downcase == "stealth archer" || pcclass.downcase == "thief" || pcclass.downcase == "assassin" || pcclass.downcase == "rogue"
  dialogue_pause(@text_delay)
  puts "'Wow, a #{pcclass.downcase}? Great minds think alike, sneaky!'"
elsif pcclass.downcase == "archer"
  dialogue_pause(@text_delay)
  puts "'Huh, an #{pcclass.downcase}? I think some precision fire will be very useful in our immediate future..'"
elsif pcclass.downcase == "warrior" || pcclass.downcase == "fighter" || pcclass.downcase == "knight"
  dialogue_pause(@text_delay)
  puts "'A #{pcclass.downcase}, eh? Strong type, I bet. Just the sort we need to get out of this mess.'"
elsif pcclass.downcase == "mage" || pcclass.downcase == "sorcerer" || pcclass.downcase == "wizard"
  dialogue_pause(@text_delay)
  puts "'Oh...a #{pcclass.downcase}? ....Well, I suppose brains over brawn has its merits in a situation like this. Just don't go zapping me accidentally, you hear?'"
elsif pcclass.downcase == "no class" || pcclass.downcase == "classless"
  dialogue_pause(@text_delay)
  puts "#{pcclass.upcase} eh? No problem, you'll figure it out as we go."
else
  dialogue_pause(@text_delay)
  puts "'A #{pcclass.downcase}? That's a new one for me. Well, whatever you are, I hope it serves us well. We need to get off this blasted ship..'"
end 
  
  dialogue_pause(@text_delay)
  puts "Suddenly, the ship lurches violently, and you are thrown to the wall of your cell. A rush of water and debris suddenly gushes into the hallway with tremendous force. "
  dialogue_pause(@text_delay)
  puts "'Woah #{name}, you alright?' You open your eyes and see a tall, dark-haired Nord standing before you with an outstretched hand. 
  'Looks like the walls of our cells were broken, and I think I can use this metal piece to pry the cell bars apart.'"
  dialogue_pause(@text_delay) 
  puts "In an incredible feat of strength, Rurik wedges the metal piece into the iron bars and pries them apart."
  dialogue_pause(@text_delay)
  puts "'This should be enough to squeeze out. You lead the way #{name}, we need to make it to the captain's quarters. It'll be safer there.'"

  #this if/else statement looks at the player class variable and has Rurik give the PC a different weapon or item depending on the class. Classic TES! 
  #In the future this could become the spot where a combat tutorial occurs
  #The item that Rurik gives the player should be an actual object stored in inventory with damage or restoration stats eventually. 
  if pcclass.downcase == "stealth archer" || pcclass.downcase == "thief" || pcclass.downcase == "assassin" || pcclass.downcase == "rogue"
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up a rusty iron dagger from the ground and hands it to you. 'This should serve, for now at least. Let's get out of here!'"
  elsif pcclass.downcase == "archer" || pcclass.downcase == "ranger"
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up a water-logged wooden bow and a few arrows from the ground and hands it to you. 'This should serve, for now at least. 
Keep an eye out for some arrows. Let's get out of here!'"
  elsif pcclass.downcase == "warrior" || pcclass.downcase == "fighter" || pcclass.downcase == "knight"
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up a rusty iron mace from the ground and hands it to you. 'This should serve, for now at least. Let's get out of here!'"
  elsif pcclass.downcase == "mage" || pcclass.downcase == "sorcerer" || pcclass.downcase == "wizard"
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up a splintering magical staff from a nearby floating shelf and hands it to you. 'This should serve for now. Let's get out of here!'"
  else 
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up an iron sword. 'This should serve for now. Let's get out of here!'"
  end 
puts ""

  #main menu with loop
  main_menu

