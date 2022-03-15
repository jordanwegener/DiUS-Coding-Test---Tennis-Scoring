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
    elsif @playerTwoPoints >= 2 && @playerTwoPoints - @playerOnePoints >= 2
      @playerTwoGames += 1
      @playerOnePoints = 0
      @playerTwoPoints = 0
    end
  end

  def score()

    # converting points into a score for display
    
    case @playerOnePoints
    when 0
      playerOneScore = "0"
    when 1
      playerOneScore = "15"
    when 2
      playerOneScore = "30"
    when 3
      playerOneScore = "40"
    end

    case @playerTwoPoints
    when 0
      playerTwoScore = "0"
    when 1
      playerTwoScore = "15"
    when 2
      playerTwoScore = "30"
    when 3
      playerTwoScore = "40"
    end

    puts "#{@playerOneGames}-#{@playerTwoGames}, #{playerOneScore}-#{playerTwoScore}"
  end
end
