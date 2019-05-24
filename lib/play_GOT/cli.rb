class PlayGOT::CLI 
  attr_accessor :you
  
  def start
    puts "When you play the Game of Thrones, you win or you die."
    
    initiate_player
    
    PlayGOT::API.new.create_houses
    
    choose_house 
    
  end 
  
  def initiate_player
    puts "Who are you, stranger?".light_red
    @you = PlayGOT::Player.new 
    puts "Welcome, #{@you.name.light_green}, to the land of Westeros."
  end 
  
  def choose_house
    puts "Choose your allegience and accept your destiny.".light_red
    
    PlayGOT::House.list_all
    
    @you.choose_house
    
    puts "You've chosen the #{@you.house.name.light_green}. Great and glorious it is.\n'#{@you.house.words.light_green}' it chants.\nIn #{@you.house.region.gsub("The", "the").light_green} it resides."
    
    puts "No one doubts it for being the #{@you.house.titles.join(", ").light_green}.\nLet #{@you.house.ancestral_weapons.join(" and ").light_green} be your secret weapon."
    
    puts "\nAre you sure about your choice? Type Y or YES to continue or anything else to choose again.".light_red
    confirm = gets.upcase.strip
      
    until confirm == "Y" || confirm == "YES" do
      self.choose_house
    end 
  end 
      
    
  
end 