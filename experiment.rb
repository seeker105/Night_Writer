# gem 'minitest', '~> 5.2'
# require 'minitest/autorun'
# require 'minitest/pride'
#
# require 'pry'
require 'fileutils'
# require 'file'


# print 1
# print " Beta"
#
#
# 5.times do |run|
# print "\e[A"
# print " #{run}th run Alpha"
# end

puts "\n\n\n"

print "0\n"
print "0\n"
print "0\n"
print "\033[3A"
print "\033[C"
print "bash\n"
print "\033[C"
print "bash\n"
print "\033[C"
print "bash\n"


puts "\n\n\n"




print " "
print "\033[B"
print "\033[D"
print " "
print "\033[B"
print "\033[D"
print " "
print "\033[2A"

print "A"
print "\033[B\033[D"
print ""
print "B"
print "\033[B\033[D"
print ""
print "C"
print "\033[2A"
print "D"
print "\033[B\033[D"
print ""
print "E"
print "\033[B\033[D"
print ""
print "F"
print "\033[B\033[D"
print ""

puts "\n\n\n"


# FileUtils.touch "temp.txt"
# f = File.new "temp.txt"
# f.open ("temp.txt", "w")
# f.write ("test message")

# IO.write("temp.txt", "test message\ntest message2\ntest message3\n")
#
#
# IO.write("temp.txt", "te\n\n")


File.write("temp.txt", "finally!!\n\n\n\n\n\n")

Char = Struct.new(:first_line, :second_line, :third_line)
x = Char.new("0.", "..", "00")
y = Char.new("..", ".0", "0.")

puts x.first_line
puts x.second_line
puts x.third_line
puts "\n\n"
puts y.first_line
puts y.second_line
puts y.third_line


# print "\e[A"
# print "\e[A"
# print "\e[A"



# def equal(other_char)
#   if @first_line != other_char.first_line
#     return false
#   elsif @second_line != other_char.second_line
#     return false
#   elsif @third_line != other_char.third_line
#     return false
#   else
#     return true
#   end
# end
