require "spec_helper"
require_relative "../../tennis"

RSpec.describe "Tennis" do
  before do
    @m = Match.new("Player 1", "Player 2")
  end
  describe "Match" do
    it "should be able to create a new match with two players and a zeroed score, with tiebreak set to false" do
      expect(@m.player_one).to eq("Player 1")
      expect(@m.player_two).to eq("Player 2")
      expect(@m.player_one_points).to eq(0)
      expect(@m.player_two_points).to eq(0)
      expect(@m.player_one_games).to eq(0)
      expect(@m.player_two_games).to eq(0)
      expect(@m.is_tie_break).to eq(false)
    end

    it "should be able to add points to a player" do
      @m.point_won_by("Player 1")
      expect(@m.player_one_points).to eq(1)
    end

    it "should display the score correctly" do
      @m.player_one_points = 2
      @m.player_two_points = 3
      @m.player_one_games = 3
      @m.player_two_games = 4

      expect { @m.score() }.to output("3-4, 30-40\n").to_stdout
    end

    it "should display deuce correctly" do
      @m.player_one_points = 3
      @m.player_two_points = 3

      expect { @m.score() }.to output("0-0, Deuce\n").to_stdout
    end

    it "should display score correctly during tiebreak" do
      @m.player_one_points = 3
      @m.player_two_points = 3
      @m.player_one_games = 3
      @m.player_two_games = 4
      @m.is_tie_break = true

      expect { @m.score() }.to output("3-4, 3-3\n").to_stdout
    end

    it "should correctly award a game to a player" do
      @m.player_one_points = 3
      @m.player_two_points = 2

      @m.point_won_by("Player 1")

      expect { @m.score() }.to output("1-0, 0-0\n").to_stdout
    end

    it "should correctly handle and display ad-scoring" do
      @m.player_one_points = 3
      @m.player_two_points = 3
      @m.player_one_games = 3
      @m.player_two_games = 3

      expect { @m.score() }.to output("3-3, Deuce\n").to_stdout

      @m.point_won_by("Player 1")

      expect { @m.score() }.to output("3-3, Adv-40\n").to_stdout

      @m.point_won_by("Player 2")

      expect { @m.score() }.to output("3-3, Deuce\n").to_stdout

      @m.point_won_by("Player 2")

      expect { @m.score() }.to output("3-3, 40-Adv\n").to_stdout

      @m.point_won_by("Player 2")

      expect { @m.score() }.to output("3-4, 0-0\n").to_stdout
    end

    it "should trigger tiebreak set correctly" do
      expect(@m.is_tie_break).to eq(false)

      @m.player_one_games = 6
      @m.player_two_games = 5
      @m.player_two_points = 3

      @m.point_won_by("Player 2")

      expect { @m.score() }.to output("6-6, 0-0\n").to_stdout

      expect(@m.is_tie_break).to eq(true)
    end

    it "should correctly handle set wins" do
      @m.player_one_games = 5
      @m.player_two_games = 4
      @m.player_one_points = 3

      expect { @m.point_won_by("Player 1") }.to output("Player 1 has won a game!\n6-4, 0-0\nPlayer 1 has won the set!\nScore has been reset. 0-0, 0-0.\n").to_stdout
    end

    it "should correctly handle tiebreak wins" do
      @m.player_one_games = 6
      @m.player_two_games = 6
      @m.player_one_points = 2
      @m.player_two_points = 6
      @m.is_tie_break = true

      expect { @m.point_won_by("Player 2") }.to output("Player 2 has won the tiebreak!\nPlayer 2 has won the set!\nScore has been reset. 0-0, 0-0.\n").to_stdout
    end
  end
end
