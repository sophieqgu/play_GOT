require_relative "./character.rb"

class PlayGOT::Player < PlayGOT::Character 
  attr_accessor :name, :allies, :enemies 
  
  def initialize
    @name = gets.strip
  end 
  
  def choose_house
    puts "Choose a number from the list of great houses and swear your allegience: ".light_red 
    PlayGOT::House.list_all
    
    input = gets.strip.to_i
    
    if (1..PlayGOT::House.all.size).to_a.include?(input)
      @house = PlayGOT::House.find(input)
      @allies = []
      @enemies = PlayGOT::House.all - [@house]
    else 
      puts "You've spoken something mystical that I don't understand.".light_red
      choose_house
    end 
  end 
  
  def status 
    puts "You belong to the #{@house.name.light_green}."
    
    if @allies.size > 0 
      puts "\nYour current allies are: #{@allies.join(", ").light_green}."
    else 
      puts "\nYou currently have no allies. Go and make one."
    end 
    
    if @enemies.size > 0 
      puts "\nYour current enemies are: #{@enemies.join(", ").light_green}."
    else 
      puts "\nYou've destroyed all your enemies. The Throne is yours!"
    end 
  end 
end 