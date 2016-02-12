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



# print "\e[A"
# print "\e[A"
# print "\e[A"
