class PlayGOT::Player 
  attr_accessor :name, :house, :secret_weapons, :stamina, :tactic, :loyalty, :allies, :defeated, :enemies, :chosen 
  
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
      @stamina = 50 
      @tactic = 25
      @loyalty = 25
      @allies = []
      @defeated = []
      @enemies = PlayGOT::House.all - [@house]
      
      case @house.name 
      when "House Hightower of the Hightower"
        @tactic += 10
      when "House Lannister of Casterly Rock"
        @stamina -= 5
        @tactic += 15
      when "House Mormont of Bear Island"
        @stamina += 5
        @tactic -= 5 
        @loyalty += 10
      when "House Royce of Runestone"
        @stamina += 5
        @tactic += 5
      when "House Stark of Winterfell"
        @tactic -= 5
        @loyalty += 15
      when "House Targaryen of King's Landing"
        @stamina += 15
        @loyalty -= 5 
      when "House Tarly of Horn Hill"
        @tactic += 5
        @loyalty += 5
      end 
    else 
      puts "You've spoken something mystical that I don't understand.".light_red
      choose_house
    end 
  end 
  
  
  def status 
    puts "Your name is #{@name.light_green}, Lord of the #{@house.name.light_green}."
    puts "You possess #{@secret_weapons.join(" and ").light_green}, ancestral weapon from your House and your allies."
    puts "Your stats are: [stamina: #{@stamina.to_s.light_green}, tactic: #{@tactic.to_s.light_green}, loyalty: #{@loyalty.to_s.light_green}]."
    
    if @allies.size > 0 
      allies = @allies.collect {|a| a.name}
      puts "\nYour current allies are: #{allies.join(", ").light_green}."
    else 
      puts "\nYou currently have no allies. Go and make one."
    end 
    
    if @defeated.size > 0 
      defeated = @defeated.collect {|d| d.name}
      puts "\nYou have defeated: #{defeated.join(", ").light_green}."
    end 
    
    if @enemies.size > 0 
      enemies = @enemies.collect {|e| e.name}
      puts "\nYour current enemies are: #{enemies.join(", ").light_green}. Conquer all of them or turn them into your allies."
    else 
      puts "\nYou've destroyed all your enemies. The Throne is yours!"
    end 
  end 
  
  
  def select_enemy
    puts "Who's on your mind?".light_red
    
    @enemies.each.with_index(1) do |e, i|
      puts "#{i} - #{e.name}".blue
    end 
    
    input = gets.strip.to_i
    
    if (1..@enemies.size).to_a.include?(input)
      @chosen = @enemies[input - 1]
    else
      puts "You've spoken something mystical that I don't understand.".light_red
      select_enemy
    end 
  end 
  
  
  def make_ally
    puts "You are about to approach the #{@chosen.name.light_green}. Your #{'loyalty'.light_green} determines your base rate of winning over an ally. Your current chance of success is #{@loyalty.to_s.light_green}%. Ready to roll the dice?"
    
    continue 
    
    roll_dice = rand(100)
    
    if roll_dice < @loyalty
      puts "LUCK IS ON YOUR SIDE, #{@name.light_green}. You've made a new ally, #{@chosen.name.light_green}."
      
      @loyalty += 10
      @allies << @chosen
      @enemies.delete(@chosen)
      @secret_weapons << @chosen.ancestral_weapons

      puts "Your #{'loyalty'.light_green} now increases to #{@loyalty.to_s.light_green}%. You've gained weapon #{@chosen.ancestral_weapons.join(" and ").light_green}. You have one less enemy."
    else 
      fight_or_flee
    end 
  end    
  
  
  def fight_or_flee
    puts "TOO LATE! #{@chosen.name.light_green} has prepared to attack. Are you ready to fight? Or you can try to flee."
    puts "1 - fight\n2 - flee".blue
        
    input = gets.strip
        
    case input 
    when "1"
      fight 
    when "2"
      flee 
    else 
      puts "You've spoken something mystical that I don't understand.".light_red
      fight_or_flee
    end 
  end 
  
  
  def fight 
    puts "You are going into battle with #{@chosen.name.light_green}. Rally your soldiers!"
    
    game = PlayGOT::RockPaperScissors.new 
    
    if game.your_score == 3 
      puts "Congratulations! You've defeated #{@chosen.name.light_green}. Your men are singing your name. You are one step closer to the Throne!"
      @defeated << @chosen 
      @enemies.delete(@chosen)
    else 
      puts "You lost in the battle with #{@chosen.name.light_green}. You body may rest but legends never die. See you next time in the Game of Thrones."
      exit!
    end 
  end 
  
  
  def flee 
    puts "Your #{'tactic'.light_green} determines your base rate of fleeing from an enemy. Your current chance of success is #{@tactic.to_s.light_green}%. Ready to roll the dice?"
    
    continue 
    
    roll_dice = rand(100)
    
    if roll_dice < @tactic
      puts "THAT WAS CLOSE! You've dodged a spear. Now lay low and make your way back to the camp."
    else 
      puts "AMBUSH! You are cornered. Your enemies are close.\nFight is your only way out. Fight in the name of your House!"
      
      continue 
      
      fight 
    end 
  end 
 
 
  def continue
    puts "\nWhen you are ready, press any key to continue.".light_red
    
    input = gets.strip
  end 
  
end 