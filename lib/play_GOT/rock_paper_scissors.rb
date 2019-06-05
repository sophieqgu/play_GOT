class PlayGOT::RockPaperScissors 
  attr_accessor :your_score, :enemy_score, :your_move, :enemy_move, :round 
  
  def initialize
  
    puts "This is a simple game of Rock, Paper, Scissors. Best 3 out of 5."
    @your_score = 0 
    @enemy_score = 0 
    @round = 1 
    
    until @your_score == 3 || @enemy_score == 3
      
      rock_paper_scissors
      
      puts "Your move: #{@your_move.light_green}\nEnemy move: #{@enemy_move.light_green}"
      
      if @your_move == "Rock" && @enemy_move == "Scissors" || @your_move == "Paper" && @enemy_move == "rock" || @your_move == "Scissors" && @enemy_move == "Paper"
        @your_score += 1 
        
        puts "You win!\nYour Score: #{@your_score.to_s.light_green}\nEnemy Score:#{@enemy_score.to_s.light_green}"
      elsif @your_move == @enemy_move 
        
        puts "Draw! No point is awarded."
      else 
        @enemy_score += 1 
        puts "You lose!\nYour Score: #{your_score.to_s.light_green}\nEnemy Score:#{enemy_score.to_s.light_green}"
      end 
  
      @round += 1 
    end 
  end 
  
  def rock_paper_scissors
    puts "Round #{@round.to_s.light_green} - Choose your move: Rock, Paper or Scissors?"
    puts "1 - Rock\n2 - Paper\n3 - Scissors".blue
      
    input = gets.strip
    @enemy_move = ["Rock", "Paper", "Scissors"].sample
    
    case input 
    when "1"
      @your_move = "Rock"
    when "2"
      @your_move = "Paper"
    when "3"
      @your_move = "Scissors"
    else 
      puts "You've spoken something mystical that I don't understand.".light_red
      
      rock_paper_scissors
    end 
  end 
  
end 