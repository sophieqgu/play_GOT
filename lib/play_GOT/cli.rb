class PlayGOT::CLI 
  attr_accessor :you, :turn
  
  def start
    puts "When you play the Game of Thrones, you win or you die."
    
    initiate_player
    
    PlayGOT::API.new.create_houses
    
    choose_house 
    
    @turn = 0 
    continue 
  end 
  
  
  def initiate_player
    puts "Who are you, stranger?".light_red
    
    @you = PlayGOT::Player.new 
    
    puts "Welcome, #{@you.name.light_green}, to the land of Westeros."
  end 
  
  
  def choose_house
    puts "Your destiny awaits. Lo and behold.".light_red
    
    @you.choose_house
    
    puts "You've chosen the #{@you.house.name.light_green}. Great and glorious it is.\n'#{@you.house.words.light_green}' it chants.\nIn #{@you.house.region.gsub("The", "the").light_green} it resides."
    puts "No one doubts it for being the #{@you.house.titles.join(", ").light_green}.\nLet #{@you.house.ancestral_weapons.join(" and ").light_green} be your secret weapon."
    puts "\nAre you sure about your choice? Type Y or YES to continue or anything else to choose again.".light_red
    
    confirm = gets.upcase.strip
      
    if confirm == "Y" || confirm == "YES"
      puts "Glory to your name #{@you.name.light_green}, Lord of the #{@you.house.name.light_green}. Winter is coming and the night is long. It's time to gather your soldiers."
    else 
      choose_house
    end 
  end 
     
      
  def rules 
    puts "\nTo win the Game of Thrones you must do the following: "
    puts "1 - Survive the Winter that sweeps through Westeros randomly.".blue
    puts "2 - Conquer all your enemies or turn them into your allies. ".blue
    puts "Your #{'stamina'.light_green} determines your probability of surviving the Winter. Each additional ally adds another 5 percent chance of survival. Each lost battle decreases 5 percent."
    puts "Your #{'tactic'.light_green} determines your probability of fleeing from an enemy. Some secret weapons may increase your chance of success."
    puts "Your #{'loyalty'.light_green} determines your probability of winning over an ally. Some secret weapons may increase your chance of persuasion."
  end 
  
  
  def menu 
    @turn += 1 
    
    if @turn % 5 == 0 
      @you.survive_winter
    end 
    
    puts "What do you want to do?".light_red
    puts "1 - Read the rules of the game.\n2 - View your current status.\n3 - Go find an ally.\n4 - Go attack an enemy.\n5 - Read about secret weapons.\n6 - Exit the game."
    
    input = gets.strip 
    
    case input 
    when "1" 
      rules 
      continue
    when "2"
      @you.status
      continue 
    when "3"
      @you.select_enemy
      @you.make_ally
      continue
    when "4"
      @you.select_enemy
      @you.fight
      continue
    when "5"
      puts "The module is being secretly developed. Coming soon!"
      continue
    when "6"
      exit
    else   
      puts "You've spoken something mystical that I don't understand.".light_red
      menu
    end 
  end 
  
  
  def continue
    puts "\nWhen you are ready, press any key to continue.".light_red
   
    input = gets.strip
    
    if @you.enemies.size > 0
      menu
    else 
      win 
    end 
  end 
  
  
  def win 
    puts "All hail your Grace, #{@you.name.light_green} of #{@you.house.name.light_green}, First of Your Name, King of the Andals and the First Men, Lord of the Six Kingdoms, and Protector of the Realm."
    
    puts "\nWesteros is yours. May your rule long and prosperous, and your name remembered forever.".blue
    
    puts "\nUntil next time.\n".light_red
    
    exit!
  end 
  
  
  def exit 
    puts "Are you sure you want to leave? Type Y or YES to confirm or anything else to go back to the menu.".light_red
    
    confirm = gets.strip.upcase
    
    if confirm == "Y" || confirm == "YES"
      puts "Goodbye, #{@you.name.light_green}. See you next time in the Game of Thrones."
      exit!
    else 
      menu
    end
  end 
  
end 