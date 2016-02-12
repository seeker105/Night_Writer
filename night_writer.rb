require 'pry'

class NightWriter
  attr_reader :file_reader

    def initialize
      @reader = FileReader.new
    end

    def encode_file_to_braille
      # I wouldn't worry about testing this method
      # unless you get everything else done
      plain = @reader.read
      puts plain
      braille = encode_to_braille(plain)
    end

    def encode_to_braille(input)
      # you've taken in an INPUT string
      # do the magic
      # send out an OUTPUT string
    end

    def join_braille_chars_into_three_strings(braille_chars)
      first_line = ""
      second_line = ""
      third_line = ""
      completed_strings = [first_line, second_line, third_line]
      braille_chars.each do |b_char|
        first_line += b_char.first_line
        second_line += b_char.second_line
        third_line += b_char.third_line
      end
      return completed_strings
    end


end # of NightWriter class


class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end


nw = NightWriter.new
nw.encode_file_to_braille
