class PlayGOT::CLI 
  attr_accessor :you
  
  def start
    puts "When you play the Game of Thrones, you win or you die."
    
    initiate_player
    
    PlayGOT::API.new.create_houses
    
    choose_house 
    
    rules 
    
    menu
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
      puts "Congratulations. You are now Lord of the #{@you.house.name.light_green}. Winter is coming and the night is long. It's time to gather your soldiers."
    else 
      choose_house
    end 
  end 
      
  def rules 
    puts "\nTo win the Game of Thrones you must do the following: "
    puts "1 - Survive the Winter that sweeps through Westeros randomly.".blue
    puts "2 - Conquer all your enemies or turn them into your allies. ".blue
    puts "Your #{'stamina'.light_green} determines your base rate of surviving the Winter. Each additional ally adds another 10 percent chance."
    puts "Your #{'tactic'.light_green} determines your base rate of successful fleeing when confronting an enemy."
    puts "Your #{'loyalty'.light_green} determines your base rate of winning over an ally."
    puts "\nWhen you are ready, press any key to continue.".light_red
    
    input = gets.strip
    
    menu
  end 
  
  def menu 
    puts "What do you want to do?".light_red
    puts "1 - Read the rules again.\n2 - View your current stats.\n3 - Go find an ally.\n4 - Go attack an enemy.\n5 - Read about secret weapons.\n6 - Exit the game"
    
    input = gets.strip 
    
    case input 
    when "1" 
      rules 
    when "6"
      exit
    else   
      puts "You've spoken something mystical that I don't understand.".light_red
      menu
    end 
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