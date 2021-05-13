class Triangle
  # write code here
  attr_accessor :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    sides = [] << @side_a << @side_b << @side_c
    max_side = sides.each_with_index.max
    sum_other_sides = 0
    sides.each_with_index {|side, index| sum_other_sides += index != max_side[1] ? side : 0}
    if (sum_other_sides <= max_side[0]) then
      raise TriangleError
    elsif @side_a == @side_b && @side_b == @side_c
      :equilateral
    elsif @side_a == @side_b || @side_b == @side_c || @side_a == @side_c
      :isosceles
    elsif @side_a != @side_b && @side_b != @side_c && @side_a != @side_c
      :scalene
    end

  end

  class TriangleError < StandardError
    def message
      "the given triangle is invalid!"
    end
  end
end

triangle = Triangle.new(10, 10, 10)
