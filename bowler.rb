require_relative './lib/game.rb'

def next_throw game

  puts "your current score is #{game.total_score}"
  puts "please enter your next result"
  result = gets.chomp 
  game.add_throw(result.to_i)
  next_throw(game)
  exit if !(0..10).include?(result)

end

game = Game.new
puts "Hello, and welcome to Bowler, please enter yout first result"
result = gets.chomp 
game.add_throw(result.to_i)
next_throw(game)