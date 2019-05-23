class PlayGOT::CLI 
  
  def call 
    puts "When you play the Game of Thrones, you win or you die."
    puts "Who are you, stranger?"
    you = PlayGOT::Player.new 
    puts "Welcome, #{you.name}, to the land of Westeros. Choose your allegience and accept your destiny."
    PlayGOT::API.list_houses
  end 
  
end 