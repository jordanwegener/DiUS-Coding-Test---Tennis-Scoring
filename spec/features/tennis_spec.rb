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
  end
end
