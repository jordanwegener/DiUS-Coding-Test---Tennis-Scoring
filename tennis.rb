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
      @playerOnePoints += 1
    else
      @playerTwoPoints += 1
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
  end

  def score()

    # converting points into a score for display

    playerOneScore = self.getFormattedScore(@playerOnePoints)
    playerTwoScore = self.getFormattedScore(@playerTwoPoints)

    puts "#{@playerOneGames}-#{@playerTwoGames}, #{playerOneScore}-#{playerTwoScore}"
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
    else
      return "0"
    end
  end
end
