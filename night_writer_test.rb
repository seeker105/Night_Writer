gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require 'pry'
require 'night_writer'

class NightWriterTest < MiniTest::Test

  test it can read in an alphanumeric text file

  test it can output an alphanumeric text file and print number of characters

  test it can read a multi-char braille file and parse them into individual characters

  test it can output to a text_file and print number of characters

  test it can read in a single character alphanumeric file and output a
  single character braille text file

  test it can read in a multiple character alphanumeric file and output a
  multiple character braille text file

  test it can read in a single character braille file and output a
  single character alphanumeric text file

  test it can read in a multiple character braille file and output a
  multiple character alphanumeric text file

  test it can output a braille file that wraps past 80 characters

  test it can output a braille file that wraps to multiple lines

  test it can read in and translate a braille file that wraps past 80 characters

  test it can read in and translate a braille file that wraps to multiple lines




end

# !> /Users/christopher1/Night_Writer/night_writer_test.rb:10: syntax error, unexpected keyword_in, expecting keyword_end
# !>   test it can read in an alphanumeric text file
# !>                      ^
# !> /Users/christopher1/Night_Writer/night_writer_test.rb:14: syntax error, unexpected tIDENTIFIER, expecting keyword_do or '{' or '('
# !> ...t can read a multi-char braille file and parse them into ind...
# !> ...                               ^
# !> /Users/christopher1/Night_Writer/night_writer_test.rb:18: syntax error, unexpected keyword_in, expecting keyword_end
# !>   test it can read in a single character alphanume...
# !>                      ^
# !> /Users/christopher1/Night_Writer/night_writer_test.rb:21: syntax error, unexpected keyword_in, expecting keyword_end
# !>   test it can read in a multiple character alphanu...
# !>                      ^
# !> /Users/christopher1/Night_Writer/night_writer_test.rb:24: syntax error, unexpected keyword_in, expecting keyword_end
# !>   test it can read in a single character braille file and output a
# !>                      ^
# !> /Users/christopher1/Night_Writer/night_writer_test.rb:27: syntax error, unexpected keyword_in, expecting keyword_end
# !>   test it can read in a multiple character braille file and output a
# !>                      ^
# !> /Users/christopher1/Night_Writer/night_writer_test.rb:30: syntax error, unexpected tIDENTIFIER, expecting keyword_end
# !> /Users/christopher1/Night_Writer/night_writer_test.rb:34: syntax error, unexpected keyword_in, expecting keyword_end
# !>   test it can read in and translate a braille file...
# !>                      ^
# !> /Users/christopher1/Night_Writer/night_writer_test.rb:34: syntax error, unexpected tIDENTIFIER, expecting keyword_end
# !> /Users/christopher1/Night_Writer/night_writer_test.rb:36: syntax error, unexpected keyword_in, expecting keyword_end
# !>   test it can read in and (translate a braille fil...
# !>                      ^
# !> /Users/christopher1/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib/seeing_is_believing/event_stream/producer.rb:97:in `record_exception': undefined method `size' for nil:NilClass (NoMethodError)
# !> \tfrom /Users/christopher1/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib/seeing_is_believing/the_matrix.rb:40:in `block in <top (required)>'
