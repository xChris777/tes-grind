#uses the yaml tool for saving system
require 'yaml'
#creates the Player class
class Player 
  
attr_accessor :pc_name, :pc_class, :pc_origin # This allows you to read/write these easily

def initialize
@pc_name = nil
@pc_class = nil
@pc_origin = nil
@wood = 0
@ore = 0
@woodcutting_level = 1
@mining_level = 1
@pc_level = 1
@woodcutting_xp = 0
@mining_xp = 0
@pc_xp = 0
end 

#display stats
def print_stats
       puts "You are #{@pc_name}, a #{@pc_class.downcase} of #{@pc_origin}."
       puts "You have #{@wood} pieces of wood"
       puts "You have #{@ore} pieces of ore"
       puts "You have achieved level #{@woodcutting_level} woodcutting"
       puts "You have achieved level #{@mining_level} mining"
       puts "You have #{@pc_xp} experience points"
       puts "You are level #{@pc_level}"
end

#woodcutting skill method
def woodcutting_skill
  puts "Press Enter to return to the skill menu"
  puts
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
      puts "You are level #{@pc_level}"
      break
    end
  end 
end

#mining skill method
def mining_skill
  puts "Press Enter to return to the skill menu"
  puts
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
        puts "You have #{@ore} pieces of ore"
        puts "You have achieved level #{@mining_level} mining"
        puts "You have #{@pc_xp} experience points"
        puts "You are level #{@pc_level}"
        break
      end
    end 
end
end




