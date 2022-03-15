# DiUS Coding Test #3 - Tennis Scoring - Jordan Wegener

This application was written to score a set of tennis. The user must use IRB to manually create and manipulate a match in the IRB console.

## Installation

Ruby will need to be installed to run this application. https://www.ruby-lang.org/en/documentation/installation/

Simply clone this repo, navigate to the directory containing `tennis.rb` and run `irb -r ./tennis.rb`.

## Usage

To begin a new match, in IRB use the following command:

`match = Match.new('Fed', 'Rafa')`

The names 'Fed' and 'Rafa' can be replaced with any name desired - the first argument will be Player 1's name and the second will be Player 2's name.

Now, to award a point to either player, use the following command:

`match.pointWonByPlayer('Fed')`

Substitute the name of the player that has scored a point.

To check the score at any point, use the following command:

`match.score`