gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require 'pry'


# print 1
# print " Beta"
#
#
# 5.times do |run|
# print "\e[A"
# print " #{run}th run Alpha"
# end
class FunClass

  def print_one
    puts "\n\nthis is one: 1\n\n"
  end

  def found
    "FOUND"
  end

  def switch_number_to_letter(x)
    x.length.times do |n|
      x[n] == "0" ? increment = 58 : increment = 48
      x.setbyte(n, x.getbyte(n) + increment )
    end
    return x
  end

  def switch_letters_to_number(input)
    input = input.strip
    input = input.delete("#")
    input.length.times do |char_index|
      input[char_index] == "j" ? decrement = 58 : decrement = 48
      input.setbyte(char_index, input.getbyte(char_index) - decrement )
    end
    return input + " "
  end

end

puts "\n\n\n"

t= FunClass.new
x = "a 1234567890 c   aaaa2 dljs34 sdkljf567  8 dkjd9 fj  0"
t.print_one

# x.each_byte do |n|
#   puts n
#   puts "change"
#   n=n+1
#   puts n
# end
#
# x.length.times do |n|
#   x.setbyte(n, x.getbyte(n) + 1 )
# end



y = x.gsub(/\d+/) {|n| "#" + t.switch_number_to_letter(n)}
puts y

z = y.gsub(/#[a-z]+(\s|\z)/) { |n| t.switch_letters_to_number(n)}
puts z


puts "\n\n\n"
# print "\033[2A"



# print "\e[A"
# print "\e[A"
# print "\e[A"
