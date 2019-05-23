require_relative "./character.rb"

class PlayGOT::Player < PlayGOT::Character 
  attr_accessor :name 
  
  def initialize
    @name = gets.strip
  end 
  
end 