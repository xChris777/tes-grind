# Serialize the object into a YAML string
# yaml_string = YAML.dump(player_object)
#
#Save that string to a file
#File.write('save_game.yml', yaml_string)
#
#loaded_player_object = YAML.load_file('save_game.yml')
#
#Can call methods on it, like:
#loaded_player_object.print_stats
#
#uses the yaml tool for saving system
require 'yaml'

#creates the Player class
class Player 
  
def initialize

@wood = 0
@ore = 0
@woodcutting_level = 1
@mining_level = 1
@pc_level = 1
@woodcutting_xp = 0
@mining_xp = 0
@pc_xp = 0
end 

#woodcutting skill method
def woodcutting_skill
  puts "Press Enter to return to the main menu"
      
  puts "You begin to chop a tree"
  loop do
    puts "Chop chop chop.."
    @woodcutting_xp += 3 
    @pc_xp += 5 
    @wood += 3
    #woodcutting level up system
    if @woodcutting_xp >= 100
      @woodcutting_level += 1
      puts "You have reached level #{@woodcutting_level}!"
      @woodcutting_xp = 0
    end
    #character level up system
    if @pc_xp >= 800
      @pc_level += 1
      puts "You have reached level #{@pc_level}!"
      @pc_xp = 0
    end

    sleep(1)
    if IO.select([STDIN], nil, nil, 0)
      STDIN.gets
      puts "You have #{@wood} pieces of wood"
      puts "You have achieved level #{@woodcutting_level} woodcutting"
      puts "You have #{@pc_xp} experience points"
      break
    end
  end 
end

#mining skill method
def mining_skill
  puts "Press Enter to return to the main menu"
        
  puts "You begin to swing your pickaxe"
    loop do
      puts "Clang, clang, clang.."
      @mining_xp += 3 
      @pc_xp += 5 
      @ore += 3
      #mining level up system
      if @mining_xp >= 100
        @mining_level += 1
        puts "You have reached level #{@mining_level}!"
        @mining_xp = 0
      end
      #character level up system
      if @pc_xp >= 1000
        @pc_level += 1
        puts "You have reached level #{@pc_level}!"
        @pc_xp = 0
      end
  
      sleep(1)
      if IO.select([STDIN], nil, nil, 0)
        STDIN.gets
        puts "You have #{@wood} pieces of wood"
        puts "You have #{@ore} pieces of ore"
        puts "You have achieved level #{@woodcutting_level} woodcutting"
        puts "You have achieved level #{@mining_level} mining"
        puts "You have #{@pc_xp} experience points"
        puts "You are level #{@pc_level}"
        break
      end
    end 
end
end




