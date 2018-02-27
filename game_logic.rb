require './players'


class Logic 
  attr_accessor :p1, :p2

  def initialize (p1, p2)
    @p1 = Player.new(p1)
    @p2 = Player.new(p2)
    @answer = 0
    @turn_player = self.turn_player
    
  end

# start the game with a random order player
  def turn_player
    who_start = 1 + rand(2)
    if who_start == 1
      @p1
    else
      @p2
    end
  end

# build a question with random numbers and operators
  def math_problem
    random1 = 1 + rand(20)
    random2 = 1 + rand(20)
    random3 = rand(3)
    array_operators = ['+', '-', '*']
    operator = array_operators[random3]
    if operator == '+'
        @answer = random1 + random2
        return "#{random1} + #{random2}"
    elsif operator == '-'
        @answer = random1 - random2
        return "#{random1} - #{random2}"
    elsif operator == '*'
        @answer = random1 * random2
        return "#{random1} * #{random2}"
     end
  end

  def questions
    loop do
      puts "#{@turn_player.name}: What does #{math_problem} equal?"
      playerAnswer = $stdin.gets.chomp

      if playerAnswer.to_i == @answer.to_i 
        puts "#{@turn_player.name}: YES! You are correct."
      else
        puts "#{@turn_player.name}: Seriously? No!" 
        @turn_player.kill
      end

      if @turn_player == @p1
        oponent = @p2
      else
        oponent = @p1
      end  

      if @turn_player.dead?
        puts "#{oponent.name} win by #{oponent.life}/3"
        puts "---- GAME OVER ----"
        puts "Good Bye"
        break
      elsif @turn_player == @p1
        puts "#{@turn_player.name}: #{@turn_player.life}/3 vs #{@p2.name}: #{@p2.life}/3"
        @turn_player = @p2
        puts "---- NEW TURN ----"
      else
        puts "#{@turn_player.name}: #{@turn_player.life}/3 vs #{@p1.name}: #{@p1.life}/3"
        @turn_player = @p1
        puts "---- NEW TURN ----"
      end
    end  
  end
end


