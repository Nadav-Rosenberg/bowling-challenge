class Frame

  attr_accessor :throws

  def initialize
    @throws = [nil, nil, nil]
    @counter = 0
  end

  def add_throw(result)
    if total_score + result > 10
      raise "Result must be between 0 and #{10 - total_score}"
    end
      
    @throws[2] = 0 if @counter == 1 && (@throws[0] + result) < 10
    @throws[@counter] = result
    @counter += 1
  end

  def total_score
    @throws.map(&:to_i).reduce :+
  end

end