# DiUS Coding Test #3 - Tennis Scoring - Jordan Wegener

This application was written to score a set of tennis. The user must use IRB to manually create and manipulate a match in the IRB console.

Having not used Ruby for a while, I thought this would be a good opportunity to brush up on putting together a basic terminal app in the language. Having mostly worked in React for a while there was certainly some things I'd forgotten, including Ruby convention. I began by getting the basic game and set scoring functionality working, then moved on to the more complicated ad-scoring and tiebreak functionality.

## Installation

Ruby will need to be installed to run this application. For instructions on how to install Ruby, visit https://www.ruby-lang.org/en/documentation/installation/

You will also need rspec installed to run the tests. To install it, first install ruby then run `sudo gem install rspec && sudo gem install rspec-expectations`

To install and run the Tennis app simply clone this repo, navigate to the directory containing `tennis.rb` in terminal and run `irb -r ./tennis.rb`

## Usage

Usage of this application will require manual manipulation of objects using IRB (Interactive Ruby). Some familiarity with Ruby will help! You will need to enter all the following commands into IRB rather than your regular shell.

Once IRB is running and `tennis.rb` is available to it (`irb -r ./tennis.rb`) to begin a new match, use the following command:

`match = Match.new('Fed', 'Rafa')`

The names 'Fed' and 'Rafa' can be replaced with any name desired - the first argument will be Player 1's name and the second will be Player 2's name. Multiple matches can be created at once by using different names, e.g. `tennis = Match.new('Nick', 'Thanasi')`

Now, to award a point to either player, use the following command:

`match.point_won_by('Fed')`

Substitute the name of the player that has scored a point.

To check the score at any point, use the following command:

`match.score`

You can also reset the set at any point if you wish to zero the scores by using the following command:

`match.end_set`

## Testing

A test suite is included. To run the tests, navigate to the directory containing `tennis.rb` and run `rspec spec/features/tennis_spec.rb`