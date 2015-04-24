require 'game'

describe Game do
  it 'when initialized, current frame is 0' do
    game = described_class.new
    expect(game.current_frame).to eq(0)
  end

  it 'when it add thorws 3,4 current frame is 1' do
    game = described_class.new
    game.add_throw(3)
    game.add_throw(4)
    expect(game.current_frame).to eq(1)
  end

  it 'when it add thorws 10, 10, 2, 8 current frame is 3' do
    game = described_class.new
    game.add_throw(10)
    game.add_throw(10)
    game.add_throw(2)
    game.add_throw(8)
    expect(game.current_frame).to eq(3)
  end

  it 'throws error if the number is larger than 10' do
    game = described_class.new
    expect { game.add_throw(11) }.to raise_error 
      ("Result must be between 0 and 10")
  end

  it 'throws error if the number is smaller than 0' do
    game = described_class.new
    expect { game.add_throw(-1) }.to raise_error 
      ("Result must be between 0 and 10")
  end

  it 'throws error if the second throw adds to more than 10' do
    game = described_class.new
    game.add_throw(8)
    expect { game.add_throw(3) }.to raise_error 
      ("Result must be between 0 and 2")
  end

end
