class Char

  attr_accessor :first_line, :second_line, :third_line

  def initialize(first_line, second_line, third_line)
    @first_line=first_line
    @second_line=second_line
    @third_line=third_line
  end

  def equal(other_char)
   (@first_line == other_char.first_line) & (@second_line == other_char.second_line) & (@third_line == other_char.third_line)
  end



end
