=begin


Variables: 
@pc_name
@pc_origin
@pc_class 
@woodcutting_level 
@mining_level
@woodcutting_xp
@mining_xp
@pc_level
@pc_xp

=end

#link to player.rb file
require_relative 'player'
#needed for save system
require 'yaml'

TG_SAVE_FILE = 'tesgrindsave.yaml'

#ACTIVE METHODS
#dialogue delay
def dialogue_pause(delay_time)
  sleep(delay_time)
  puts
end

def dev_mode_check
  if @pc_name == "Dev"
    @dev_mode = true
    puts "Dev mode has been activated."
    puts "Enter player name or DELETE for save deletion"
    @pc_name = gets.chomp.capitalize.strip
    @text_delay = 0.2
      if @pc_name.downcase == "delete"
        File.delete("tesgrindsave.yaml") if File.exist?("tesgrindsave.yaml")
        puts "Save file deleted"
        puts "Enter player name"
        @pc_name = gets.chomp.capitalize.strip
      end
  elsif @pc_name == "Dev2"
      @dev_mode = true
      puts "Dev mode 2 has been activated."
      @pc_name = "Chris"
      @pc_origin = "Skyrim"
      @pc_class = "Warrior"
      @text_delay = 0.2
  end
end

def save_game
  # Serialize the player object into a YAML string
  yaml_string = YAML.dump(@player)
  #Save that string to a file
  File.write(TG_SAVE_FILE, yaml_string)
end

def delete_save
  puts "Are you sure? Type DELETE to confirm, or anything else to return to the menu."
        confirmation = gets.chomp.strip
        if confirmation.upcase == "DELETE"
          File.delete(TG_SAVE_FILE) if File.exist?(TG_SAVE_FILE)
          puts "Save file deleted, the game will now exit.."
          exit
        elsif confirmation.upcase != "DELETE"
          main_menu
        end
end

def main_menu
  loop do
    puts "
    Main Menu
      1. Skills
      2. Show stats and inventory
      3. Delete save file
      4. Save and exit
    "
    selection = gets.chomp.strip
    if selection == "1" || selection == "1."
        skill_menu
    elsif selection == "2" || selection == "2."
        @player.print_stats
    elsif selection == "3" || selection == "3."
        delete_save
    elsif selection == "4" || selection == "4."
        puts "Goodbye!"
        dialogue_pause(@text_delay)
        save_game
        exit
    else 
      puts "Please input a numerical menu option."
    end
end
end



def skill_menu 
  loop do
    puts "
    Skills Menu
      1. Woodcutting
      2. Mining
      3. Return to Main Menu
    "
    selection = gets.chomp.strip
    if selection == "1" || selection == "1."
        @player.woodcutting_skill
    elsif selection == "2" || selection == "2."
        @player.mining_skill
    elsif selection == "3" || selection == "3."
        break
    else puts "Please input a numerical menu option."
    end
end
end

#BEGINNING OF GAME 
#intro conversation / getting player name, origin, class and dev mode (if dev is entered as name)
if File.exist?(TG_SAVE_FILE) == false
@player = Player.new
puts "Welcome to TES Grind, an unofficial The Elder Scrolls experience!"
puts "Please enter your name: "
#sets text delay variables
@text_delay = 3
@text_delay_slow = 3
@text_delay_fast = 1
dev_mode = false
#checks if name entered is Dev or dev and activates dev mode which currently speeds up text delivery but 
#will be used for additional testing in the future
@pc_name = gets.chomp.capitalize
dev_mode_check
#takes name from user input, assigns to variable, capitalizes it
if @pc_name == "Josie" || @pc_name == "Jos" || @pc_name == "Sicilian Baby" || @pc_name == "Josephine"
  puts "Hello my beautiful wife! Thanks for testing this game for me :) Love you!"
elsif @pc_name == "Emmy" || @pc_name == "Emilia" || @pc_name == "Em" 
  puts "Hello my beautiful child! Thanks for testing this game for me! :) Love you!"
end
dialogue_pause(@text_delay)
puts "#{@pc_name}, you are a prisoner on an Imperial prison ship, sailing somewhere along the outskirts of Tamriel."
dialogue_pause(@text_delay)
puts "You are unsure how you ended up here, as you have no recollection of the past few days. Even memories from prior are a hazy blur."
dialogue_pause(@text_delay)
puts "As you struggle to recall what led you to this moment, you hear a booming voice from the cell next to yours."
dialogue_pause(@text_delay)
puts "'Hey, you there! The name's Rurik.....and you are?'"
puts "..."
dialogue_pause(@text_delay)
puts "'Pleasure to meet ya', #{@pc_name}!'"
dialogue_pause(@text_delay)
puts "'Whereabouts are you from then?'"
dialogue_pause(@text_delay_fast)
puts "Enter your character's location of origin:"
#takes player origin from user input, assigns to variable, capitalizes it
@pc_origin = gets.chomp.capitalize.strip
  if @pc_origin.downcase == "skyrim"
    dialogue_pause(@text_delay)
    puts "'Aha! A fellow Skyrim native! Hopefully we can talk about the homeland over a nice mug of spiced mead one day. If we live through this gods-forsaken mess, that is.'"
  else
    dialogue_pause(@text_delay)
    puts "'Ah, from  #{@pc_origin} eh? I've never been there myself, but I've heard grand tales from my seafaring friends. I hope we live long enough to share them with ya'"
  end 
  dialogue_pause(@text_delay)
  puts "'Say, what class are you? I'm a bit of a thief myself, though I bet I look the fool considering I got myself locked up here. I'm not the most quiet person unfortunately, try as I might...'"
  dialogue_pause(@text_delay_fast)
  puts "Enter your character's class or vocation:"
  #takes player class from user input, assigns to variable
  @pc_class = gets.chomp.capitalize.strip 
#this if/else statement gives different responses from Rurik depending on your class
if @pc_class.downcase == "stealth archer" || @pc_class.downcase == "thief" || @pc_class.downcase == "assassin" || @pc_class.downcase == "rogue"
  dialogue_pause(@text_delay)
  puts "'Wow, a #{@pc_class.downcase}? Great minds think alike, sneaky!'"
elsif @pc_class.downcase == "archer" || @pc_class.downcase == "ranger"
  dialogue_pause(@text_delay)
  puts "'Huh, an #{@pc_class.downcase}? I think some precision fire will be very useful in our immediate future..'"
elsif @pc_class.downcase == "warrior" || @pc_class.downcase == "fighter" || @pc_class.downcase == "knight"
  dialogue_pause(@text_delay)
  puts "'A #{@pc_class.downcase}, eh? Strong type, I bet. Just the sort we need to get out of this mess.'"
elsif @pc_class.downcase == "mage" || @pc_class.downcase == "sorcerer" || @pc_class.downcase == "wizard" || @pc_class.downcase == "magician"
  dialogue_pause(@text_delay)
  puts "'Oh...a #{@pc_class.downcase}? ....Well, I suppose brains over brawn has its merits in a situation like this. Just don't go zapping me accidentally, you hear?'"
elsif @pc_class.downcase == "no class" || @pc_class.downcase == "classless"
  dialogue_pause(@text_delay)
  puts "#{@pc_class.upcase} eh? No problem, you'll figure it out as we go."
else
  dialogue_pause(@text_delay)
  puts "'A #{@pc_class.downcase}? That's a new one for me. Well, whatever you are, I hope it serves us well. We need to get off this blasted ship..'"
end 
  
dialogue_pause(@text_delay)
puts "Suddenly, the ship lurches violently, and you are thrown to the wall of your cell. A rush of water and debris suddenly gushes into the hallway with tremendous force. "
dialogue_pause(@text_delay)
puts "'Woah #{@pc_name}, you alright?' You open your eyes and see a tall, dark-haired Nord standing before you with an outstretched hand."
dialogue_pause(@text_delay)
puts "'Looks like the walls of our cells were broken, and I think I can use this metal piece to pry the cell bars apart.'"
dialogue_pause(@text_delay) 
puts "In an incredible feat of strength, Rurik wedges the metal piece into the iron bars and pries them apart."
dialogue_pause(@text_delay)
puts "'Huh, maybe I should be swinging an axe instead of trying to sneak around with a dagger.'"
dialogue_pause(@text_delay)
puts "'Anyway, this should be enough to squeeze out. You lead the way #{@pc_name}, we need to make it to the captain's quarters. It'll be safer there.'"

  #this if/else statement looks at the player class variable and has Rurik give the PC a different weapon or item depending on the class. Classic TES! 
  #In the future this could become the spot where a combat tutorial occurs
  #The item that Rurik gives the player should be an actual object stored in inventory with damage or restoration stats eventually. 
  if @pc_class.downcase == "stealth archer" || @pc_class.downcase == "thief" || @pc_class.downcase == "assassin" || @pc_class.downcase == "rogue"
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up a rusty iron dagger from the ground and hands them to you. 'This should serve, for now at least. Let's get out of here!'"
  elsif @pc_class.downcase == "archer" || @pc_class.downcase == "ranger"
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up a water-logged wooden bow and a few arrows from the ground and hands it to you. 'This should serve, for now at least. 
    Keep an eye out for some arrows. Let's get out of here!'"
  elsif @pc_class.downcase == "warrior" || @pc_class.downcase == "fighter" || @pc_class.downcase == "knight"
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up a rusty iron mace from the ground and hands it to you. 'This should serve, for now at least. Let's get out of here!'"
  elsif @pc_class.downcase == "mage" || @pc_class.downcase == "sorcerer" || @pc_class.downcase == "wizard" || @pc_class.downcase == "magician"
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up a splintering magical staff from a nearby floating shelf and hands it to you. 'This should serve for now. Let's get out of here!'"
  else 
    dialogue_pause(@text_delay)
    puts "After you and Rurik squeeze out of the cell, he picks up an iron sword. 'This should serve for now. Let's get out of here!'"
  end 
dialogue_pause(@text_delay)
puts "You and Rurik fight your way out of the sinking prison ship room by room, floor by floor. Eventually, the two of you make it to the entrance."
dialogue_pause(@text_delay)
puts "'#{@pc_name}, it looks like we crashed into a large island...'"
dialogue_pause(@text_delay)
puts "'Aha, I see the Direnni Tower! We must be somewhere off the coast of High Rock near the Iliac Bay!"
dialogue_pause(@text_delay) 
puts "'Alright #{@pc_name}, you start building some shelter, and I'll go scout ahead to make sure there aren't any bandits lurking about.'"
dialogue_pause(@text_delay)
puts "Rurik has left the party. You must gather resources, build a settlement and hone your skills. It will take a lot of work to make it back to the mainland"
dialogue_pause(@text_delay)
main_menu
else 
  #main menu with loop
  main_menu
end
 