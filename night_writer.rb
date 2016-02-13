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
      # I wouldn't worry about testing this method
      # unless you get everything else done
      plain = @reader.read
      puts plain
      plain.strip!
      print plain
      puts plain
      braille_chars = @translator.translate_alpha_to_braille(plain)
      puts braille_chars[0].first_line
      puts braille_chars[0].second_line
      puts braille_chars[0].third_line

      puts braille_chars[1].first_line
      puts braille_chars[1].second_line
      puts braille_chars[1].third_line

      text = ""
      3.times { plain.split.each do |word|
        text += word + "\n"
      end }

      puts join_braille_chars_into_strings(braille_chars)
      @writer.write(text)
      braille = encode_to_braille(plain)
    end

    def encode_to_braille(input)
      # you've taken in an INPUT string
      # do the magic
      # send out an OUTPUT string
    end

    def join_braille_chars_into_strings(braille_chars)
      # binding.pry
      first_line = second_line = third_line = ""
      completed_strings_array = [first_line, second_line, third_line]
      braille_chars.each do |b_char|
        first_line += b_char.first_line
        second_line += b_char.second_line
        third_line += b_char.third_line
      end
      completed_strings_array[0] + "\n" +
      completed_strings_array[1] + "\n" +
      completed_strings_array[2]
    end


end # of NightWriter class


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
nw.encode_file_to_braille
end
