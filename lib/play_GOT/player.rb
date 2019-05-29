require_relative "./character.rb"

class PlayGOT::Player < PlayGOT::Character 
  attr_accessor :name, :allies, :enemies, :secret_weapons 
  
  def initialize
    @name = gets.strip
  end 
  
  def choose_house
    puts "Choose a number from the list of great houses and swear your allegience: ".light_red 
    PlayGOT::House.list_all
    
    input = gets.strip.to_i
    
    if (1..PlayGOT::House.all.size).to_a.include?(input)
      @house = PlayGOT::House.find(input)
      @stamina = 0
      @tactic = 0
      @loyalty = 0
      @secret_weapons = @house.ancestral_weapons
      @allies = []
      @enemies = PlayGOT::House.all - [@house]
    else 
      puts "You've spoken something mystical that I don't understand.".light_red
      choose_house
    end 
  end 
  
  def status 
    puts "Your name is #{self.name.light_green}, Lord of the #{@house.name.light_green}."
    puts "You possess #{@secret_weapons.join(" and ").light_green}, ancestral weapons from your House and your allies."
    puts "Your stats are: [stamina: #{@stamina.to_s.light_green}, tactic: #{@tactic.to_s.light_green}, loyalty: #{@loyalty.to_s.light_green}]."
    
    if @allies.size > 0 
      allies = @allies.collect {|a| a.name}
      puts "\nYour current allies are: #{allies.join(", ").light_green}."
    else 
      puts "\nYou currently have no allies. Go and make one."
    end 
    
    if @enemies.size > 0 
      enemies = @enemies.collect {|e| e.name}
      puts "\nYour current enemies are: #{enemies.join(", ").light_green}. Conquer all of them or turn them into your allies."
    else 
      puts "\nYou've destroyed all your enemies. The Throne is yours!"
    end 
    
    
  end 
end 