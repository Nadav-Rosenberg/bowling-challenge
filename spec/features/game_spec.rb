require 'capybara/rspec'
require 'game'

feature 'takes a throw result and return a game score' do

  scenario 'it takes 3 and returns 3' do
    game = Game.new
    game.add_throw(3)
    expect(game.total_score).to eq(3)
  end

  scenario 'it takes 3,4 and returns 7' do
    game = Game.new
    game.add_throw(3)
    game.add_throw(4)
    expect(game.total_score).to eq(7)
  end

  scenario 'it takes 3,4,8,2,5 and returns 27' do
    game = Game.new
    game.add_throw(3)
    game.add_throw(4)
    game.add_throw(8)
    game.add_throw(2)
    game.add_throw(5)
    expect(game.total_score).to eq(27)
  end

  scenario 'it returns 300 for 12 throws of 10' do
    game = Game.new
    12.times { game.add_throw(10) }
    expect(game.total_score).to eq(300)
  end

  scenario 'it returns 0 for 20 throws of 0' do
    game = Game.new
    20.times { game.add_throw(0) }
    expect(game.total_score).to eq(0)
  end

end

