require_relative "./character.rb"

class PlayGOT::Player < PlayGOT::Character 
  attr_accessor :name 
  
  def initialize
    @name = gets.strip
  end 
  
  def choose_house
    puts "Choose a number from the list of great houses and swear your allegience: ".light_red 
    PlayGOT::House.list_all
    input = gets.strip.to_i
    if (1..PlayGOT::House.all.size).to_a.include?(input)
      @house = PlayGOT::House.find(input)
    else 
      puts "You've spoken something mystical that I don't understand.".light_red
      choose_house
    end 
  end 
end 