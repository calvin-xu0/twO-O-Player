class Game
  def initialize()
    @players = [Player.new("Player 1"), Player.new("Player 2")]
    @loser = false
  end

  def play
    @players.cycle do |current_player|
      if @loser
        puts "#{current_player.name} wins with a score of #{current_player.lives}/3"
        break
      end

      turn(current_player)      
      if !loser?(current_player)
        turn_scores = @players.map {|player| "#{player.name}: #{player.lives}/3"}
        puts turn_scores.join(" vs ")
        puts "----- NEW TURN -----"
      end
    end
    game_end
  end

  def turn(player)
    question = Question.new
    puts "#{player.name}: What does #{question.num1} plus #{question.num2} equal?"
    answer = gets.chomp.to_i
    if answer == question.sum
      puts "#{player.name}: YES! You are correct."
    else
      puts "#{player.name}: Seriously? No!"
      player.lives -= 1
    end
  end

  def game_end
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def loser?(player)
    return @loser = player.lives == 0
  end
end