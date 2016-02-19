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
    character_count = alpha.length
    alpha = convert_special_alpha_characters(alpha)
    finalstring = encode_to_braille(alpha)
    @writer.write(finalstring)
    puts "Created '#{ARGV[1]}' containing #{character_count} characters"
  end

  def encode_file_to_alpha
    braille_string = @reader.read
    input = encode_to_alpha(braille_string)
    input = revert_special_alpha_characters(input)
    @writer.write(input)
    puts "Created '#{ARGV[1]}' containing #{input.length} characters"
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

  def encode_to_alpha(braille_string)
    braille_rows_array = parse_input_to_braille_rows(braille_string)
    braille_chars_array = parse_rows_to_braille_chars(braille_rows_array)
    @translator.braille_to_alpha(braille_chars_array)
  end

  def is_special_alpha_character(character)
    (character == "&" ) || (character == "#")
  end

  def parse_rows_to_braille_chars(braille_rows_array)
    braille_chars_array = []
    while braille_rows_array[0].length > 0
      new_braille_char = []
      3.times do |row_number|
        new_braille_char[row_number] = braille_rows_array[row_number].slice!(0, 2)
      end
      braille_chars_array << new_braille_char
    end
    return braille_chars_array
  end

  def parse_input_to_braille_rows(braille_string)
    braille_rows_array = ["", "", ""]
    while braille_string.length > 0
      3.times do |row_number|
        braille_rows_array[row_number] += braille_string.slice!(/.*(\n|\z)/).delete("\n")
      end
    end
    return braille_rows_array
  end

  def switch_number_to_letter(number)
    number.length.times do |digit_index|
      number[digit_index] == "0" ? increment = 58 : increment = 48
      number.setbyte(digit_index, number.getbyte(digit_index) + increment )
    end
    return "#" + number
  end

  def switch_letters_to_number(input)
    input[-1] == " " ? end_char = " " : end_char = ""
    input = input.strip
    input = input.delete("#")
    input.length.times do |char_index|
      input[char_index] == "j" ? decrement = 58 : decrement = 48
      input.setbyte(char_index, input.getbyte(char_index) - decrement )
    end
    return input + end_char
  end

  def convert_word_to_contraction(word)
    word.include?("&") ? caps = "&" : caps = ""
    caps + @translator.convert_word_to_contraction(word.delete("&"))
  end

  def convert_contraction_to_word(character)
    character.include?("&") ? caps = "&" : caps = ""
    caps + @translator.convert_contraction_to_word(character.delete("&"))
  end

  def convert_special_alpha_characters(input)
    input = input.gsub(/[A-Z]/){ |character| "&" + character.downcase }
    input = process_contractions(input, :word_to_contraction)
    input.gsub(/\d+/) {|number| switch_number_to_letter(number)}
  end

  def revert_special_alpha_characters(input)
    input = input.gsub(/#[a-z]+(\s|\z)/) { |character| switch_letters_to_number(character)}
    input = process_contractions(input, :contraction_to_word)
    input.gsub(/&[a-z]/) { |character_pair| character_pair[1].upcase }
  end

  def process_contractions(input, direction)
    input.delete("\n")
    words_array = input.split
    input[0] == " " ? (first_char, start_index = " ", 0) :
                      (first_char, start_index = "", 1)
    input[-1] == " " ? (end_char, end_index = " ", words_array.length - 1) :
                       (end_char, end_index = "", words_array.length - 2)
    if start_index <= end_index
      start_index.upto(end_index) do |index|
        case direction
        when :word_to_contraction
          words_array[index] = convert_word_to_contraction(words_array[index])
        when :contraction_to_word
          words_array[index] = convert_contraction_to_word(words_array[index])
        end
      end
    end
    input = first_char + words_array.join(" ") + end_char
  end

  def concatenate_a_line_of_braille(line_number, character_array)
    result = ""
    character_array.each do |character|
      result += character[line_number]
    end
    return result
  end

  def group_alpha_characters(input)
    groups = []
    while input.length > 80
      is_special_alpha_character(input[79]) ? (groups << input.slice!(0, 79)) :
                                              (groups << input.slice!(0, 80))
    end
    groups << input
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
  case ARGV[2]
  when "a-b"
    nw.encode_file_to_braille
  when "b-a"
    nw.encode_file_to_alpha
  end

end
