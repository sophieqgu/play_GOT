class PlayGOT::CLI 
  
  def call 
    puts "When you play the Game of Thrones, you win or you die."
    PlayGOT::API.list_characters
  end 
  
end 