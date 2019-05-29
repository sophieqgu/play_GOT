class PlayGOT::Player 
  attr_accessor :name, :house, :secret_weapons, :stamina, :tactic, :loyalty, :allies, :enemies 
  
  def initialize
    @name = gets.strip
  end 
  
  def choose_house
    puts "Choose a number from the list of great houses and swear your allegience: ".light_red 
    PlayGOT::House.list_all
    
    input = gets.strip.to_i
    
    if (1..PlayGOT::House.all.size).to_a.include?(input)
      @house = PlayGOT::House.find(input)
      @secret_weapons = @house.ancestral_weapons
      @allies = []
      @enemies = PlayGOT::House.all - [@house]
      
      case @house.name 
        when "House Hightower of the Hightower"
          @stamina = 20 
          @tactic = 45
          @loyalty = 35
        when "House Lannister of Casterly Rock"
          @stamina = 20
          @tactic = 75
          @loyalty = 5
        when "House Mormont of Bear Island"
          @stamina = 20
          @tactic = 25 
          @loyalty = 55
        when "House Royce of Runestone"
          @stamina = 25
          @tactic = 60
          @loyalty = 15
        when "House Stark of Winterfell"
          @stamina = 25
          @tactic = 10
          @loyalty = 65
        when "House Targaryen of King's Landing"
          @stamina = 70
          @tactic = 5
          @loyalty = 25
        when "House Tarly of Horn Hill"
          @stamina = 25
          @tactic = 25
          @loyalty = 50
        end 
    else 
      puts "You've spoken something mystical that I don't understand.".light_red
      choose_house
    end 
  end 
  
  def status 
    puts "Your name is #{@name.light_green}, Lord of the #{@house.name.light_green}."
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