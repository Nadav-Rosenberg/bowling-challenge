require_relative 'frame'

class Game

  attr_reader :current_frame

  def initialize
    @frames = [Frame.new, Frame.new, Frame.new, Frame.new, Frame.new,
               Frame.new, Frame.new, Frame.new, Frame.new, Frame.new,
               Frame.new, Frame.new]
    @current_frame = 0
    @counter_result = 0
    @counter_times = 0
  end

  def add_throw(result)
    raise "Result must be between 0 and 10" if result > 10 || result < 0
    @frames[@current_frame].add_throw(result)
    add_bonus(-2, result)
    add_bonus(-1, result)
    counter(result)
  end

  def total_score
    total = 0
    @frames[0..9].each { |i| total += i.total_score }
    total
  end

  private

  def counter(result)
    @counter_result += result
    @counter_times += 1
    return unless @counter_result == 10 || @counter_times == 2
    @current_frame += 1
    @counter_result = 0
    @counter_times = 0
  end

  def add_bonus(where, result)
    return unless @current_frame + where >= 0
    i = @frames[@current_frame + where].throws.index(nil)
    @frames[@current_frame + where].throws[i] = result if i
  end

end
