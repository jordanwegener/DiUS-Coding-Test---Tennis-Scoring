require "spec_helper"
require_relative "../../tennis"

RSpec.describe "Tennis" do
  before do
    @m = Match.new("Player 1", "Player 2")
  end
  describe "Match" do
    it "should be able to create a new match with two players and a zeroed score, with tiebreak set to false" do
      expect(@m.playerOne).to eq("Player 1")
      expect(@m.playerTwo).to eq("Player 2")
      expect(@m.playerOnePoints).to eq(0)
      expect(@m.playerTwoPoints).to eq(0)
      expect(@m.playerOneGames).to eq(0)
      expect(@m.playerTwoGames).to eq(0)
      expect(@m.isTieBreak).to eq(false)
    end

    it "should be able to add points to a player" do
      @m.pointWonBy("Player 1")
      expect(@m.playerOnePoints).to eq(1)
    end

    it "should display the score correctly" do
      @m.playerOnePoints = 2
      @m.playerTwoPoints = 3
      @m.playerOneGames = 3
      @m.playerTwoGames = 4

      expect { @m.score() }.to output("3-4, 30-40\n").to_stdout
    end

    it "should display deuce correctly" do
      @m.playerOnePoints = 3
      @m.playerTwoPoints = 3

      expect { @m.score() }.to output("0-0, Deuce\n").to_stdout
    end

    it "should display score correctly during tiebreak" do
      @m.playerOnePoints = 3
      @m.playerTwoPoints = 3
      @m.playerOneGames = 3
      @m.playerTwoGames = 4
      @m.isTieBreak = true

      expect { @m.score() }.to output("3-4, 3-3\n").to_stdout
    end

    it "should correctly award a game to a player" do
      @m.playerOnePoints = 3
      @m.playerTwoPoints = 2

      @m.pointWonBy("Player 1")

      expect { @m.score() }.to output("1-0, 0-0\n").to_stdout
    end

    it "should correctly handle and display ad-scoring" do
      @m.playerOnePoints = 3
      @m.playerTwoPoints = 3
      @m.playerOneGames = 3
      @m.playerTwoGames = 3

      expect { @m.score() }.to output("3-3, Deuce\n").to_stdout

      @m.pointWonBy("Player 1")

      expect { @m.score() }.to output("3-3, Adv-40\n").to_stdout

      @m.pointWonBy("Player 2")

      expect { @m.score() }.to output("3-3, Deuce\n").to_stdout

      @m.pointWonBy("Player 2")

      expect { @m.score() }.to output("3-3, 40-Adv\n").to_stdout

      @m.pointWonBy("Player 2")

      expect { @m.score() }.to output("3-4, 0-0\n").to_stdout
    end

    it "should trigger tiebreak set correctly" do
      expect(@m.isTieBreak).to eq(false)

      @m.playerOneGames = 6
      @m.playerTwoGames = 5
      @m.playerTwoPoints = 3

      @m.pointWonBy("Player 2")

      expect { @m.score() }.to output("6-6, 0-0\n").to_stdout

      expect(@m.isTieBreak).to eq(true)
    end

    it "should correctly handle set wins" do
      @m.playerOneGames = 5
      @m.playerTwoGames = 4
      @m.playerOnePoints = 3

      expect { @m.pointWonBy("Player 1") }.to output("Player 1 has won a game!\n6-4, 0-0\nPlayer 1 has won the set!\nScore has been reset. 0-0, 0-0.\n").to_stdout
    end

    it "should correctly handle tiebreak wins" do
      @m.playerOneGames = 6
      @m.playerTwoGames = 6
      @m.playerOnePoints = 2
      @m.playerTwoPoints = 6
      @m.isTieBreak = true

      expect { @m.pointWonBy("Player 2") }.to output("Player 2 has won the tiebreak!\nPlayer 2 has won the set!\nScore has been reset. 0-0, 0-0.\n").to_stdout
    end
  end
end
