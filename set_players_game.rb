class StartGame
  attr_accessor :p1, :p2  
  def initialize
    @p1 =""
    @p2 =""
    
  end

  def ask_names
    puts "What is your name player 1? " 

    player1 = $stdin.gets.chomp
    
    @p1 = player1
    
    puts "What is your name player 2? "
    
    player2 = $stdin.gets.chomp
    
    @p2 = player2
    

  end
end

