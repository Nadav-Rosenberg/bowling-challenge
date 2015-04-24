require 'frame'

describe Frame do

  it 'gets 2 and returns 2' do
    frame = described_class.new
    frame.add_throw(2)
    expect(frame.total_score).to eq(2)
  end

  it 'gets 2,5 and returns 7' do
    frame = described_class.new
    frame.add_throw(2)
    frame.add_throw(5)
    expect(frame.total_score).to eq(7)
  end

  it 'has three throws' do
    frame = described_class.new
    expect(frame.throws.length).to eq(3)
  end

end
