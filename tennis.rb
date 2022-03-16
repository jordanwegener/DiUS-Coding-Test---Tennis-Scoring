class Match
  attr_accessor :playerOne, :playerTwo, :playerOnePoints, :playerTwoPoints, :playerOneGames, :playerTwoGames

  def initialize(playerOne, playerTwo)
    @playerOne = playerOne
    @playerTwo = playerTwo
    @playerOnePoints = 0
    @playerTwoPoints = 0
    @playerOneGames = 0
    @playerTwoGames = 0
    puts "Match created. #{@playerOne} vs #{@playerTwo}, score is #{@playerOnePoints} - #{@playerTwoPoints}."
    puts "Let's play tennis!"
  end

  def pointWonByPlayer(player)
    if player == @playerOne
      if @playerOnePoints == 3 && @playerTwoPoints == 4
        @playerTwoPoints = 3
      else
        @playerOnePoints += 1
      end
    elsif player == @playerTwo
      if @playerTwoPoints == 3 && @playerOnePoints == 4
        @playerOnePoints = 3
      else
        @playerTwoPoints += 1
      end
    else
      puts "There's no player with that name."
    end

    if @playerOnePoints >= 4 && @playerOnePoints - @playerTwoPoints >= 2
      @playerOneGames += 1
      @playerOnePoints = 0
      @playerTwoPoints = 0
      puts "#{@playerOne} has won a game!"
    elsif @playerTwoPoints >= 2 && @playerTwoPoints - @playerOnePoints >= 2
      @playerTwoGames += 1
      @playerOnePoints = 0
      @playerTwoPoints = 0
      puts "#{@playerTwo} has won a game!"
    end

    # self.debug()

    self.checkPlayerWonSet()
  end

  def checkPlayerWonSet()
    if @playerOneGames >= 6 && @playerOneGames - @playerTwoGames >= 2
      puts "#{@playerOne} has won the set!"
      self.reset()
    elsif @playerTwoGames >= 6 && @playerTwoGames - @playerOneGames >= 2
      puts "#{@playerTwo} has won the set!"
      self.reset()
    end
  end

  def reset()
    @playerOnePoints = 0
    @playerTwoPoints = 0
    @playerOneGames = 0
    @playerTwoGames = 0
    puts "Score has been reset. 0-0, 0-0."
  end

  def score()

    # converting points into a score for display

    playerOneScore = self.getFormattedScore(@playerOnePoints)
    playerTwoScore = self.getFormattedScore(@playerTwoPoints)

    if @playerOnePoints && @playerTwoPoints == 3
      puts "#{@playerOneGames}-#{@playerTwoGames}, Deuce"
    else
      puts "#{@playerOneGames}-#{@playerTwoGames}, #{playerOneScore}-#{playerTwoScore}"
    end
  end

  def getFormattedScore(points)
    case points
    when 0
      return "0"
    when 1
      return "15"
    when 2
      return "30"
    when 3
      return "40"
    when 4
      return "Adv"
    else
      return "0"
    end
  end

  def debug()
    puts "playerOne: #{@playerOne}"
    puts "playerTwo: #{@playerTwo}"
    puts "playerOnePoints: #{@playerOnePoints}"
    puts "playerTwoPoints: #{@playerTwoPoints}"
    puts "playerOneGames: #{@playerOneGames}"
    puts "playerTwoGames: #{@playerTwoGames}"
  end
end
