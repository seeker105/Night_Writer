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
    alpha = flag_special_alpha_characters(alpha)
    finalstring = encode_to_braille(alpha)
    @writer.write(finalstring)
    puts "Created '#{ARGV[1]}' containing #{character_count} characters"
  end

  def encode_file_to_alpha
    braille_string = @reader.read
    alpha_string = encode_to_alpha(braille_string)
    @writer.write(alpha_string)
    puts "Created '#{ARGV[1]}' containing #{alpha_string.length} characters"
  end












  # def group_alpha_characters(input) #old with contraction slice attemp
  #   groups = []
  #   slice_point = 80
  #   while input.length > slice_point
  #     slice_point = check_for_contraction_slice(input)
  #     if is_special_alpha_character(input[slice_point-1])
  #       groups << input.slice!(0, slice_point-1)
  #     else
  #       groups << input.slice!(0, slice_point)
  #     end
  #   end
  #   groups << input
  # end

  # def check_for_contraction_slice(input)
  #   # this should only be called when input.length > 80
  #   contraction_match_array = find_all_contractions(input)
  #   #if no contractions slice at 80 characters
  #   if contraction_match_array.length == 0
  #     return 80
  #   end
  #
  #   # if there are 2 or more contractions check if we have a pair crossing the slice
  #   if contraction_match_array.length > 1
  #     (contraction_match_array.length-1).times do |contraction_number|
  #       if (contraction_match_array[contraction_number].end(0) == 79) & (contraction_match_array[contraction_number+1].begin(0) == 79)
  #         return contraction_match_array[contraction_number].begin(0)
  #       end
  #     end
  #   end
  #
  #   # if a contraction crosses the slice then slice it before the contraction
  #   contraction_match_array.each do |contraction_match|
  #     if (contraction_match.begin(0) < 79) & (contraction_match.end(0) > 80)
  #       return contraction_match.begin(0)
  #     end
  #   end
  #   # if no contractions cross the slice return the regular value
  #   return 80
  #
  # end

  # def find_all_contractions(input)
  #   contraction_match_array = []
  #   start_index = 0
  #   while ( contraction_match = input.match(/(\s|\s&)[a-z]\s/, start_index) ) != nil
  #     start_index = contraction_match.end(0) - 1
  #     if @translator.is_contraction?(contraction_match.to_s.strip.delete("&"))
  #       contraction_match_array << contraction_match
  #     end
  #   end
  #   return contraction_match_array
  # end



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
    alpha_string = @translator.braille_to_alpha(braille_chars_array)
    alpha_string = convert_special_characters(alpha_string)
  end



  #----------------------------------------------------------

  # def contraction_found?(input, start_index)
  #   possible_contraction = input.match(/(\s|\s&)[a-z]+\s/, start_index).to_s
  #   x = @translator.is_contraction?(possible_contraction.strip.delete("&"))
  # end

  def remove_spaces_and_caps(word)
    word.strip.delete("&")
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
    # if there's a space after the number when it comes we need a space at the end
    # when it goes out
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
    caps + @translator.convert_word_to_contraction(word.strip.delete("&"))
  end

  def convert_contraction_to_word(character)
    character.include?("&") ? caps = "&" : caps = ""
    caps + @translator.convert_contraction_to_word(character.strip.delete("&"))
  end

  def flag_special_alpha_characters(input)
    input = input.gsub(/[A-Z]/){ |character| "&" + character.downcase }
    input = contraction_conversion_process(input, :word_to_contraction)
    input.gsub(/\d+/) {|number| switch_number_to_letter(number)}
  end

  def convert_special_characters(alpha_string)
    alpha_string = alpha_string.gsub(/#[a-z]+(\s|\z)/) { |character| switch_letters_to_number(character)}
    alpha_string = contraction_conversion_process(alpha_string, :contraction_to_word)
    # alpha_string = alpha_string.gsub(/(\s|\s&)[a-z]\s/) { |character| convert_contraction_to_word(character) }
    alpha_string.gsub(/&[a-z]/) { |character_pair| character_pair[1].upcase }
  end

  def contraction_conversion_process(input, direction)
    input.delete("\n")
    words_array = input.split
    if input[0] == " "
      first_char = " "
      start_index = 0
    else
      first_char = ""
      start_index = 1
    end
    if input[-1] == " "
      end_char = " "
      end_index = words_array.length - 1
    else
      end_char = ""
      end_index = words_array.length - 2
    end
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
      if is_special_alpha_character(input[79])
        groups << input.slice!(0, 79)
      else
        groups << input.slice!(0, 80)
      end
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

# x = nw.flag_special_alpha_characters("a 1234567890 c   aaaa2 dljs34 sdkljf567  8 dkjd9 fj  0")
# puts x
#
# y = nw.convert_special_characters(x)
# puts y

end
