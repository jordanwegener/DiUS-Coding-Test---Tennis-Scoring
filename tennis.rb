class Match
  attr_accessor :playerOne, :playerTwo, :playerOnePoints, :playerTwoPoints, :playerOneGames, :playerTwoGames, :isTieBreak

  def initialize(playerOne, playerTwo)
    @playerOne = playerOne
    @playerTwo = playerTwo
    @playerOnePoints = 0
    @playerTwoPoints = 0
    @playerOneGames = 0
    @playerTwoGames = 0
    @isTieBreak = false
    puts "Match created. #{@playerOne} vs #{@playerTwo}, score is #{@playerOnePoints} - #{@playerTwoPoints}."
    puts "Let's play tennis!"
  end

  def pointWonBy(player)
    if @isTieBreak
      puts "before adding point"
      self.debug()
      if player == @playerOne
        @playerOnePoints += 1
      elsif player == @playerTwo
        @playerTwoPoints += 1
      else
        puts "There's no player with that name."
      end

      if @playerOnePoints >= 7 && @playerOnePoints - @playerTwoPoints >= 2
        @playerOneGames += 1
        self.endGame()
        puts "#{@playerOne} has won the tiebreak!"
      elsif @playerTwoPoints >= 7 && @playerTwoPoints - @playerOnePoints >= 2
        @playerTwoGames += 1
        self.endGame()
        puts "#{@playerTwo} has won the tiebreak!"
      end
      self.checkPlayerWonSet()
      self.debug()
    end

    if !@isTieBreak
      puts "before adding point"
      self.debug()
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
        self.endGame()
        puts "#{@playerOne} has won a game!"
        self.score()
      elsif @playerTwoPoints >= 4 && @playerTwoPoints - @playerOnePoints >= 2
        @playerTwoGames += 1
        self.endGame()
        puts "#{@playerTwo} has won a game!"
        self.score()
      end
      self.debug()
      self.checkPlayerWonSet()
    end
  end

  def checkPlayerWonSet()
    if @isTieBreak
      if @playerOneGames > 6
        puts "#{@playerOne} has won the set!"
        self.endSet()
      elsif @playerTwoGames > 6
        puts "#{@playerTwo} has won the set!"
        self.endSet()
      end
    end

    if @playerOneGames >= 6 && @playerOneGames - @playerTwoGames >= 2
      puts "#{@playerOne} has won the set!"
      self.endSet()
    elsif @playerTwoGames >= 6 && @playerTwoGames - @playerOneGames >= 2
      puts "#{@playerTwo} has won the set!"
      self.endSet()
    end

    if @playerOneGames == 6 && @playerTwoGames == 6 && !@isTieBreak
      puts "Tiebreak set!"
      self.endGame()
      @isTieBreak = true
    end
  end

  def endSet()
    @playerOnePoints = 0
    @playerTwoPoints = 0
    @playerOneGames = 0
    @playerTwoGames = 0
    puts "Score has been reset. 0-0, 0-0."
  end

  def endGame()
    @playerOnePoints = 0
    @playerTwoPoints = 0
  end

  def score()

    # converting points into a score for display

    playerOneScore = @isTieBreak ? @playerOnePoints : self.getFormattedScore(@playerOnePoints)
    playerTwoScore = @isTieBreak ? @playerTwoPoints : self.getFormattedScore(@playerTwoPoints)

    if @playerOnePoints == 3 && @playerTwoPoints == 3 && !@isTieBreak
      puts "#{@playerOneGames}-#{@playerTwoGames}, Deuce"
    else
      puts "#{@playerOneGames}-#{@playerTwoGames}, #{playerOneScore}-#{playerTwoScore}"
    end
  end

  def getFormattedScore(points)
    if !@isTiebreak
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
  end

  def debug()
    puts "playerOne: #{@playerOne}"
    puts "playerTwo: #{@playerTwo}"
    puts "playerOnePoints: #{@playerOnePoints}"
    puts "playerTwoPoints: #{@playerTwoPoints}"
    puts "playerOneGames: #{@playerOneGames}"
    puts "playerTwoGames: #{@playerTwoGames}"
    puts "isTieBreak: #{@isTieBreak}"
  end
end
