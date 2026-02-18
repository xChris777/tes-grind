#uses the yaml tool for saving system
require 'yaml'
require_relative 'tes-grind'
#creates the Player class
class Player 
  
def initialize

@wood = 0
@ore = 0
@woodcuttingLevel = 1
@miningLevel = 1
@charLevel = 1
@woodcuttingXP = 0
@miningXP = 0
@charXP = 0
end 

#display stats
def print_stats
       puts "You have #{@wood} pieces of wood"
       puts "You have #{@ore} pieces of ore"
       puts "You have achieved level #{@woodcuttingLevel} woodcutting"
       puts "You have achieved level #{@miningLevel} mining"
       puts "You have #{@charXP} experience points"
       puts "You are level #{@charLevel}"
end

#woodcutting skill method
def woodcutting_skill
  puts "Press Enter to return to the main menu"
  dialogue_pause(@text_delay)
  puts "You begin to chop a tree"
  loop do
    puts "Chop chop chop.."
    @woodcuttingXP += 3 
    @charXP += 5 
    @wood += 3
    #woodcutting level up system
    if @woodcuttingXP >= 100
      @woodcuttingLevel += 1
      puts "You have reached level #{@woodcuttingLevel}!"
      @woodcuttingXP = 0
    end
    #character level up system
    if @charXP >= 800
      @charLevel += 1
      puts "You have reached level #{@charLevel}!"
      @charXP = 0
    end

    sleep(1)
    if IO.select([STDIN], nil, nil, 0)
      STDIN.gets
      puts "You have #{@wood} pieces of wood"
      puts "You have achieved level #{@woodcuttingLevel} woodcutting"
      puts "You have #{@charXP} experience points"
      puts "You are level {@charLevel}"
      break
    end
  end 
end

#mining skill method
def mining_skill
  puts "Press Enter to return to the main menu"
  dialogue_pause(@text_delay)
  puts "You begin to swing your pickaxe"
    loop do
      puts "Clang, clang, clang.."
      @miningXP += 3 
      @charXP += 5 
      @ore += 3
      #mining level up system
      if @miningXP >= 100
        @miningLevel += 1
        puts "You have reached level #{@miningLevel}!"
        @miningXP = 0
      end
      #character level up system
      if @charXP >= 1000
        @charLevel += 1
        puts "You have reached level #{@charLevel}!"
        @charXP = 0
      end
  
      sleep(1)
      if IO.select([STDIN], nil, nil, 0)
        STDIN.gets
        puts "You have #{@ore} pieces of ore"
        puts "You have achieved level #{@miningLevel} mining"
        puts "You have #{@charXP} experience points"
        puts "You are level #{@charLevel}"
        break
      end
    end 
end
end




