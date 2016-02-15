require 'pry'
require_relative 'braille_translator'

class NightWriter
  attr_reader :file_reader

    def initialize
      @reader = FileReader.new
      @writer = FileWriter.new
      @translator = BrailleTranslator.new
    end

    def encode_file_to_braille
      alpha = @reader.read.delete("\n")
      # alpha = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n"  # => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n"
      character_count = alpha.length
      alpha = flag_special_alpha_characters(alpha)
      finalstring = encode_to_braille(alpha)
      @writer.write(finalstring)
      puts "Created '#{ARGV[1]}' containing #{character_count} characters"
    end

    def concatenate_a_line_of_braille(line_number, character_array)
      result = ""
      character_array.each do |character|
        result += character[line_number]
      end
      return result
    end

    def encode_to_braille(input)
      finalstring = ""
      groups = group_alpha_characters(input)
      groups.each do |group|
        braille_chars = @translator.alpha_to_braille(group)
        3.times do |line_number|
          finalstring += concatenate_a_line_of_braille(line_number, braille_chars) + "\n"
        end # 3 times                                                                                 # => 3
      end # groups.each
      return finalstring
    end

    def group_alpha_characters(input)
      groups = []
      while input.length > 80
        puts input.length
        if is_special_alpha_character(input[79])
          groups << input.slice!(0, 79)
        else
          groups << input.slice!(0, 80)
        end
        puts "greater than 80"
      end
      puts "not greater than 80"
      puts input.length
      groups << input
    end

    def is_special_alpha_character(character)
      character == "&"
    end

    def flag_special_alpha_characters(input)
      input.gsub(/[A-Z]/){ |character| "&" + character.downcase }
    end

    def encode_file_to_alpha
      braille_string = @reader.read
      puts braille_string.inspect
      braille_char_array = encode_to_alpha(braille_string)
    end

    def encode_to_alpha(braille_string)
      braille_char_array = []
      while braille_string.length > 0
        3.times do |row_number|
          braille_char_array += split_braille_row_into_character_rows(row_number, braille_string)
        end
      end
    end

    def method_name split_braille_row_into_character_rows(row_number, braille_string)
      output_array
    end

end # of NightWriter class


class String
  def is_capital?
    ("A".."Z").include?(self)
  end
end


class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end

class FileWriter
  def write(content)
    filename = ARGV[1]
    File.write(filename, content)
  end
end

if __FILE__ == $0
nw = NightWriter.new
# nw.encode_file_to_braille
nw.encode_file_to_alpha

end
# @translator = BrailleTranslator.new
# braille_chars = @translator.alpha_to_braille("abba")
#
#
# 3.times do |n|
#   n
# end
#
#
#
# # finalstring = nw.join_braille_chars_into_strings(braille_chars)  # ~> NoMethodError: undefined method `join_braille_chars_into_strings' for #<NightWriter:0x007fb7928acf18>
#
# x = ["a", "b", "c", "d"]
# x.each.with_index do |value, index|
#   index
#   value
# end
#
# 3.times.with_index(2) do |value,x|
#   x
#   value
# end
#
# a = [1,2,3]
# x1 = a.shift
# x1
# x2 = a.shift
# x2
# x3 = a.shift
# x3
# a
#
# a << ""
# a << ""
#
# a = a << [1]
#
# end
