class PlayGOT::CLI 
  
  def call 
    puts "When you play the Game of Thrones, you win or you die."
    initiate_player
  end 
  
  def initiate_player
    puts "Who are you, stranger?"
    you = PlayGOT::Player.new 
    
    puts "Welcome, #{you.name}, to the land of Westeros. Choose your allegience and accept your destiny."
    PlayGOT::API.new.create_houses
    PlayGOT::House.list_all
    you.choose_house
    
    puts "Are you sure about your choice? Type Y to continue or N to choose again."
  end 
  
end 