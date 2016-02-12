gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require 'pry'
require 'night_writer'

class NightWriterTest < MiniTest::Test

  test it can read in a text file and print number of characters

  test it can output to a text_file and print number of characters

  test it can read in a single character alphanumeric file and output a
  single character braille text file

  test it can read in a multiple character alphanumeric file and output a
  single character braille text file

  test it can read in a single character braille file and output a
  single character alphanumeric text file

  test it can read in a multiple character braille file and output a
  single character alphanumeric text file

  test it can output a braille file that wraps past 80 characters

  test it can output a braille file that wraps to multiple lines

  test it can read in and translate a braille file that wraps past 80 characters

  test it can read in and translate a braille file that wraps to multiple lines




end
