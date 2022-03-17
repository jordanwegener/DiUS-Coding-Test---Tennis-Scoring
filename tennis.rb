class Match
  attr_accessor :player_one, :player_two, :player_one_points, :player_two_points, :player_one_games, :player_two_games, :is_tie_break

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @player_one_points = 0
    @player_two_points = 0
    @player_one_games = 0
    @player_two_games = 0
    @is_tie_break = false
    puts "Match created. #{@player_one} vs #{@player_two}, score is #{@player_one_points} - #{@player_two_points}."
    puts "Let's play tennis!"
  end

  def point_won_by(player)
    if @is_tie_break
      if player == @player_one
        @player_one_points += 1
      elsif player == @player_two
        @player_two_points += 1
      else
        puts "There's no player with that name."
      end

      if @player_one_points >= 7 && @player_one_points - @player_two_points >= 2
        @player_one_games += 1
        self.end_game()
        puts "#{@player_one} has won the tiebreak!"
      elsif @player_two_points >= 7 && @player_two_points - @player_one_points >= 2
        @player_two_games += 1
        self.end_game()
        puts "#{@player_two} has won the tiebreak!"
      end
      self.check_player_won_set()
    end

    if !@is_tie_break
      if player == @player_one
        if @player_one_points == 3 && @player_two_points == 4
          @player_two_points = 3
        else
          @player_one_points += 1
        end
      elsif player == @player_two
        if @player_two_points == 3 && @player_one_points == 4
          @player_one_points = 3
        else
          @player_two_points += 1
        end
      else
        puts "There's no player with that name."
      end

      if @player_one_points >= 4 && @player_one_points - @player_two_points >= 2
        @player_one_games += 1
        self.end_game()
        puts "#{@player_one} has won a game!"
        self.score()
      elsif @player_two_points >= 4 && @player_two_points - @player_one_points >= 2
        @player_two_games += 1
        self.end_game()
        puts "#{@player_two} has won a game!"
        self.score()
      end
      self.check_player_won_set()
    end
  end

  def check_player_won_set()
    if @is_tie_break
      if @player_one_games > 6
        puts "#{@player_one} has won the set!"
        self.end_set()
      elsif @player_two_games > 6
        puts "#{@player_two} has won the set!"
        self.end_set()
      end
    end

    if @player_one_games >= 6 && @player_one_games - @player_two_games >= 2
      puts "#{@player_one} has won the set!"
      self.end_set()
    elsif @player_two_games >= 6 && @player_two_games - @player_one_games >= 2
      puts "#{@player_two} has won the set!"
      self.end_set()
    end

    if @player_one_games == 6 && @player_two_games == 6 && !@is_tie_break
      puts "Tiebreak set!"
      self.end_game()
      @is_tie_break = true
    end
  end

  def end_set()
    @player_one_points = 0
    @player_two_points = 0
    @player_one_games = 0
    @player_two_games = 0
    puts "Score has been reset. 0-0, 0-0."
  end

  def end_game()
    @player_one_points = 0
    @player_two_points = 0
  end

  def score()

    # converting points into a score for display

    player_one_score = @is_tie_break ? @player_one_points : self.get_formatted_score(@player_one_points)
    player_two_score = @is_tie_break ? @player_two_points : self.get_formatted_score(@player_two_points)

    if @player_one_points == 3 && @player_two_points == 3 && !@is_tie_break
      puts "#{@player_one_games}-#{@player_two_games}, Deuce"
    else
      puts "#{@player_one_games}-#{@player_two_games}, #{player_one_score}-#{player_two_score}"
    end
  end

  def get_formatted_score(points)
    if !@is_tie_break
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
    puts "player_one: #{@player_one}"
    puts "player_two: #{@player_two}"
    puts "player_one_points: #{@player_one_points}"
    puts "player_two_points: #{@player_two_points}"
    puts "player_one_games: #{@player_one_games}"
    puts "player_two_games: #{@player_two_games}"
    puts "is_tie_break: #{@is_tie_break}"
  end
end
