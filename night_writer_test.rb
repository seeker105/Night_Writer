gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require 'pry'
require_relative 'night_writer'

class NightWriterTest < MiniTest::Test

  def setup
    @nw = NightWriter.new
  end


  def test_is_special_character_returns_true_for_caps_char_and_number_switch
    assert @nw.is_special_alpha_character("#")
    assert @nw.is_special_alpha_character("&")
    refute @nw.is_special_alpha_character("a")
  end


  def test_removes_spaces_and_caps
    word = " but "
    assert_equal "but", @nw.remove_spaces_and_caps(word)

    word = " b "
    assert_equal "b", @nw.remove_spaces_and_caps(word)

    word = " &but "
    assert_equal "but", @nw.remove_spaces_and_caps(word)

    word = " &b "
    assert_equal "b", @nw.remove_spaces_and_caps(word)
  end

  def test_convert_a_short_array_lowercase_braille_rows_to_an_array_of_lowercase_braille_chars
    braille_rows_array = ["0.0.0.0.", "........", "........"]
    braille_chars_array = @nw.parse_rows_to_braille_chars(braille_rows_array)
    assert_equal ["0.", "..", ".."], braille_chars_array[0]
    assert_equal ["0.", "..", ".."], braille_chars_array[1]
    assert_equal ["0.", "..", ".."], braille_chars_array[2]
    assert_equal ["0.", "..", ".."], braille_chars_array[3]
  end

  def test_convert_an_80char_array_lowercase_braille_rows_to_an_array_of_lowercase_braille_chars
    braille_rows_array = ["","",""]
    80.times do
      braille_rows_array[0] += "0."
      braille_rows_array[1] += ".."
      braille_rows_array[2] += ".."
    end
    braille_chars_array = @nw.parse_rows_to_braille_chars(braille_rows_array)

    80.times do |n|
      assert_equal ["0.", "..", ".."], braille_chars_array[n]
    end
  end


  def test_convert_an_100char_array_lowercase_braille_rows_to_an_array_of_lowercase_braille_chars
    braille_rows_array = ["","",""]
    50.times do
      braille_rows_array[0] += "0.0."
      braille_rows_array[1] += "..0."
      braille_rows_array[2] += "...."
    end
    braille_chars_array = @nw.parse_rows_to_braille_chars(braille_rows_array)

    0.step(50,2) do |n|
      assert_equal ["0.", "..", ".."], braille_chars_array[n]
      assert_equal ["0.", "0.", ".."], braille_chars_array[n+1]
    end
  end

  def test_parsing_braille_file_string_to_an_array_of_braille_rows
    input = ("0.0.0.0.0.\n..........\n0000000000\n")
    braille_rows_array = @nw.parse_input_to_braille_rows(input)
    assert_equal "0.0.0.0.0.", braille_rows_array[0]
    assert_equal "..........", braille_rows_array[1]
    assert_equal "0000000000", braille_rows_array[2]
  end

  def test_parsing_multi_line_braille_file_string_to_an_array_of_braille_rows
    input = ("0.0.0.0.0.\n..........\n0000000000\n0.0.0.0.0.\n..........\n0000000000\n")
    braille_rows_array = @nw.parse_input_to_braille_rows(input)
    assert_equal "0.0.0.0.0.0.0.0.0.0.", braille_rows_array[0]
    assert_equal "....................", braille_rows_array[1]
    assert_equal "00000000000000000000", braille_rows_array[2]
  end

  def test_parsing_braille_file_string_without_ending_newline_to_an_array_of_braille_rows
    input = ("0.0.0.0.0.\n..........\n0000000000")
    braille_rows_array = @nw.parse_input_to_braille_rows(input)
    assert_equal "0.0.0.0.0.", braille_rows_array[0]
    assert_equal "..........", braille_rows_array[1]
    assert_equal "0000000000", braille_rows_array[2]
  end

  def test_parsing_braille_file_string_with_extra_ending_newline_to_an_array_of_braille_rows
    input = ("0.0.0.0.0.\n..........\n0000000000\n\n")
    braille_rows_array = @nw.parse_input_to_braille_rows(input)
    assert_equal "0.0.0.0.0.", braille_rows_array[0]
    assert_equal "..........", braille_rows_array[1]
    assert_equal "0000000000", braille_rows_array[2]
  end


  def test_switching_a_number_to_letter_and_putting_the_switch_character_in_front
    input = "8"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#h", output
  end

  def test_switching_numbers_to_letters_and_putting_the_switch_character_in_front
    input = "1"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#a", output

    input = "12"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#ab", output

    input = "123"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#abc", output

    input = "1234"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#abcd", output

    input = "12345"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#abcde", output

    input = "123456"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#abcdef", output

    input = "1234567"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#abcdefg", output

    input = "12345678"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#abcdefgh", output

    input = "123456789"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#abcdefghi", output

    input = "1234567890"
    output = @nw.switch_number_to_letter(input)
    assert_equal "#abcdefghij", output
  end

  def test_convert_a_switch_letter_combination_into_a_number
      input = "#a"
      output = @nw.switch_letters_to_number(input)
      assert_equal "1", output
  end

  def test_convert_a_switch_and_multiple_letters_combination_into_numbers
    input = "#a"
    output = @nw.switch_letters_to_number(input)
    assert_equal "1", output

    input = "#ab"
    output = @nw.switch_letters_to_number(input)
    assert_equal "12", output

    input = "#abc"
    output = @nw.switch_letters_to_number(input)
    assert_equal "123", output

    input = "#abcd"
    output = @nw.switch_letters_to_number(input)
    assert_equal "1234", output

    input = "#abcde"
    output = @nw.switch_letters_to_number(input)
    assert_equal "12345", output

    input = "#abcdef"
    output = @nw.switch_letters_to_number(input)
    assert_equal "123456", output

    input = "#abcdefg"
    output = @nw.switch_letters_to_number(input)
    assert_equal "1234567", output

    input = "#abcdefgh"
    output = @nw.switch_letters_to_number(input)
    assert_equal "12345678", output

    input = "#abcdefghi"
    output = @nw.switch_letters_to_number(input)
    assert_equal "123456789", output

    input = "#abcdefghij"
    output = @nw.switch_letters_to_number(input)
    assert_equal "1234567890", output
  end

  def test_convert_word_to_contraction_method_with_a_lowercase_word
    input = "but"
    output = @nw.convert_word_to_contraction(input)
    assert_equal "b", output
  end

  def test_convert_word_to_contraction_method_with_a_capitalized_word
    input = "&but"
    output = @nw.convert_word_to_contraction(input)
    assert_equal "&b", output
  end

  def test_convert_contraction_to_word_method_with_a_lowercase_word
    input = "b"
    output = @nw.convert_contraction_to_word(input)
    assert_equal "but", output
  end

  def test_convert_contraction_to_word_method_with_a_capitalized_word
    input = "&b"
    output = @nw.convert_contraction_to_word(input)
    assert_equal "&but", output
  end

  def test_it_correctly_flags_numbers
    input = "1"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#a", output

    input = "12"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#ab", output

    input = "123"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#abc", output

    input = "1234"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#abcd", output

    input = "12345"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#abcde", output

    input = "123456"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#abcdef", output

    input = "1234567"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#abcdefg", output

    input = "12345678"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#abcdefgh", output

    input = "123456789"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#abcdefghi", output

    input = "1234567890"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "#abcdefghij", output
  end

  def test_it_correctly_flags_capital_letters
    input = "Why?"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&why?", output

    input = "WHy?"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&w&hy?", output

    input = "WHY?"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&w&h&y?", output

    input = "WHY nOt?"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&w&h&y n&ot?", output
  end

  def test_it_correctly_converts_words_to_contractions
    input = " Can we?"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal " &c we?", output

    input = "How can we?"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&how c we?", output

    input = "You have to go!"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&you h to go!", output

    input = "We should go to the market."
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&we should g to the market.", output
  end

  def test_converting_single_word_contractions_spaced_vs_unspaced
    input = "but"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "but", output

    input = " but "
    output = @nw.flag_special_alpha_characters(input)
    assert_equal " b ", output

    input = "But"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&but", output

    input = " But "
    output = @nw.flag_special_alpha_characters(input)
    assert_equal " &b ", output
  end

  def test_converting_to_contractions_at_the_beginning_and_end_of_sentence
    input = "Go to the market, you must."
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&go to the market, y must.", output

    input = " Go to the market, you must."
    output = @nw.flag_special_alpha_characters(input)
    assert_equal " &g to the market, y must.", output

    input = " Go to the market, must you"
    output = @nw.flag_special_alpha_characters(input)
    assert_equal " &g to the market, must you", output

    input = " Go to the market, must you "
    output = @nw.flag_special_alpha_characters(input)
    assert_equal " &g to the market, must y ", output

    input = "Go to the market, must you "
    output = @nw.flag_special_alpha_characters(input)
    assert_equal "&go to the market, must y ", output
  end

  def test_it_correctly_converts_contractions_to_words
    input = " &c we?"
    output = @nw.convert_special_characters(input)
    assert_equal " Can we?", output

    input = "&how c we?"
    output = @nw.convert_special_characters(input)
    assert_equal "How can we?", output

    input = "&you h to go!"
    output = @nw.convert_special_characters(input)
    assert_equal "You have to go!", output

    input = "&we should g to the market."
    output = @nw.convert_special_characters(input)
    assert_equal "We should go to the market.", output
  end

  def test_converting_single_contractions_to_words_spaced_vs_unspaced
    input = "but"
    output = @nw.convert_special_characters(input)
    assert_equal "but", output

    input = " b "
    output = @nw.convert_special_characters(input)
    assert_equal " but ", output

    input = "&but"
    output = @nw.convert_special_characters(input)
    assert_equal "But", output

    input = " &b "
    output = @nw.convert_special_characters(input)
    assert_equal " But ", output
  end

  def test_converting_to_contractions_at_the_beginning_and_end_of_sentence
    input = "&go to the market, y must."
    output = @nw.convert_special_characters(input)
    assert_equal "Go to the market, you must.", output

    input = " &g to the market, y must."
    output = @nw.convert_special_characters(input)
    assert_equal " Go to the market, you must.", output

    input = " &g to the market, must you"
    output = @nw.convert_special_characters(input)
    assert_equal " Go to the market, must you", output

    input = " &g to the market, must y "
    output = @nw.convert_special_characters(input)
    assert_equal " Go to the market, must you ", output

    input = "&go to the market, must y "
    output = @nw.convert_special_characters(input)
    assert_equal "Go to the market, must you ", output
  end







    def test_it_correctly_converts_contractions_to_words_using_the_contraction_conversion_process_method
      input = " &c we?"
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal " &can we?", output

      input = "&how c we?"
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal "&how can we?", output

      input = "&you h to go!"
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal "&you have to go!", output

      input = "&we should g to the market."
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal "&we should go to the market.", output
    end

    def test_converting_single_contractions_to_words_spaced_vs_unspaced_using_the_contraction_conversion_process_method
      input = "but"
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal "but", output

      input = " b "
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal " but ", output

      input = "&but"
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal "&but", output

      input = " &b "
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal " &but ", output
    end

    def test_converting_to_contractions_at_the_beginning_and_end_of_sentence_using_the_contraction_conversion_process_method
      input = "&go to the market, y must."
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal "&go to the market, you must.", output

      input = " &g to the market, y must."
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal " &go to the market, you must.", output

      input = " &g to the market, must you"
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal " &go to the market, must you", output

      input = " &g to the market, must y "
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal " &go to the market, must you ", output

      input = "&go to the market, must y "
      output = @nw.contraction_conversion_process(input, :contraction_to_word)
      assert_equal "&go to the market, must you ", output
    end

    def test_it_correctly_converts_words_to_contractions_using_the_contraction_conversion_process_method
      input = " &can we?"
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal " &c we?", output

      input = "&how can we?"
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal "&how c we?", output

      input = "&you have to go!"
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal "&you h to go!", output

      input = "&we should go to the market."
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal "&we should g to the market.", output
    end

    def test_converting_single_word_contractions_spaced_vs_unspaced_using_the_contraction_conversion_process_method
      input = "but"
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal "but", output

      input = " but "
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal " b ", output

      input = "&but"
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal "&but", output

      input = " &but "
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal " &b ", output
    end

    def test_converting_to_contractions_at_the_beginning_and_end_of_sentence_using_the_contraction_conversion_process_method
      input = "&go to the market, you must."
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal "&go to the market, y must.", output

      input = " &go to the market, you must."
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal " &g to the market, y must.", output

      input = " &go to the market, must you"
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal " &g to the market, must you", output

      input = " &go to the market, must you "
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal " &g to the market, must y ", output

      input = "&go to the market, must you "
      output = @nw.contraction_conversion_process(input, :word_to_contraction)
      assert_equal "&go to the market, must y ", output
    end

    def test_for_a_given_array_of_braille_chars_concatenate_all_the_segments_in_a_given_row_number_into_one_string
      b1 = ["00", "0.", ".."]
      b2 = [".0", "..", "00"]
      b3 = ["..", "00", "0."]
      b_array = [b1]

      output1 = @nw.concatenate_a_line_of_braille(0, b_array)
      output2 = @nw.concatenate_a_line_of_braille(1, b_array)
      output3 = @nw.concatenate_a_line_of_braille(2, b_array)
      assert_equal output1, "00"
      assert_equal output2, "0."
      assert_equal output3, ".."

      b_array = [b1,b2]
      output1 = @nw.concatenate_a_line_of_braille(0, b_array)
      output2 = @nw.concatenate_a_line_of_braille(1, b_array)
      output3 = @nw.concatenate_a_line_of_braille(2, b_array)
      assert_equal output1, "00.0"
      assert_equal output2, "0..."
      assert_equal output3, "..00"

      b_array = [b1,b2,b3]
      output1 = @nw.concatenate_a_line_of_braille(0, b_array)
      output2 = @nw.concatenate_a_line_of_braille(1, b_array)
      output3 = @nw.concatenate_a_line_of_braille(2, b_array)
      assert_equal output1, "00.0.."
      assert_equal output2, "0...00"
      assert_equal output3, "..000."
    end

    def test_separating_characters_into_groups_of_80
      chars_5 = "12345"
      output = @nw.group_alpha_characters(chars_5)
      assert_equal ["12345"], output

      chars_79 = "1234567890123456789012345678901234567890123456789012345678901234567890123456789"
      output = @nw.group_alpha_characters(chars_79)
      assert_equal ["1234567890123456789012345678901234567890123456789012345678901234567890123456789"], output

      chars_80 = "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
      output = @nw.group_alpha_characters(chars_80)
      assert_equal ["12345678901234567890123456789012345678901234567890123456789012345678901234567890"], output

      chars_81 = "123456789012345678901234567890123456789012345678901234567890123456789012345678901"
      output = @nw.group_alpha_characters(chars_81)
      assert_equal ["12345678901234567890123456789012345678901234567890123456789012345678901234567890", "1"], output

      chars_160 = "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
      output = @nw.group_alpha_characters(chars_160)
      assert_equal ["12345678901234567890123456789012345678901234567890123456789012345678901234567890",
                    "12345678901234567890123456789012345678901234567890123456789012345678901234567890"], output

      chars_161 = "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901"
      output = @nw.group_alpha_characters(chars_161)
      assert_equal ["12345678901234567890123456789012345678901234567890123456789012345678901234567890",
                    "12345678901234567890123456789012345678901234567890123456789012345678901234567890", "1"], output
    end

    def test_group_alpha_characters_method_moves_marker_characters_to_the_next_lines
      chars_5 = "12345#"
      output = @nw.group_alpha_characters(chars_5)
      assert_equal ["12345#"], output

      chars_5 = "12345&"
      output = @nw.group_alpha_characters(chars_5)
      assert_equal ["12345&"], output

      chars_79 = "12345678901234567890123456789012345678901234567890123456789012345678901234567#8"
      output = @nw.group_alpha_characters(chars_79)
      assert_equal ["12345678901234567890123456789012345678901234567890123456789012345678901234567#8"], output

      chars_79 = "12345678901234567890123456789012345678901234567890123456789012345678901234567&8"
      output = @nw.group_alpha_characters(chars_79)
      assert_equal ["12345678901234567890123456789012345678901234567890123456789012345678901234567&8"], output

      chars_80 = "1234567890123456789012345678901234567890123456789012345678901234567890123456789#A"
      output = @nw.group_alpha_characters(chars_80)
      assert_equal ["1234567890123456789012345678901234567890123456789012345678901234567890123456789", "#A"], output

      chars_80 = "1234567890123456789012345678901234567890123456789012345678901234567890123456789&A"
      output = @nw.group_alpha_characters(chars_80)
      assert_equal ["1234567890123456789012345678901234567890123456789012345678901234567890123456789", "&A"], output

      chars_81 = "123456789012345678901234567890123456789012345678901234567890123456789012345678901"
      output = @nw.group_alpha_characters(chars_81)
      assert_equal ["12345678901234567890123456789012345678901234567890123456789012345678901234567890", "1"], output

      chars_160 = "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
      output = @nw.group_alpha_characters(chars_160)
      assert_equal ["12345678901234567890123456789012345678901234567890123456789012345678901234567890",
                    "12345678901234567890123456789012345678901234567890123456789012345678901234567890"], output

      chars_161 = "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901"
      output = @nw.group_alpha_characters(chars_161)
      assert_equal ["12345678901234567890123456789012345678901234567890123456789012345678901234567890",
                    "12345678901234567890123456789012345678901234567890123456789012345678901234567890", "1"], output

    end




















end










# test_it can read in an alphanumeric text file
#
# test it can output an alphanumeric text file and print number of characters
#
# test it can read a multi-char braille file and parse them into individual characters
#
# test it can output to a text_file and print number of characters
#
# test it can read in a single character alphanumeric file and output a
# single character braille text file
#
# test it can read in a multiple character alphanumeric file and output a
# multiple character braille text file
#
# test it can read in a single character braille file and output a
# single character alphanumeric text file
#
# test it can read in a multiple character braille file and output a
# multiple character alphanumeric text file
#
# test it can output a braille file that wraps past 80 characters
#
# test it can output a braille file that wraps to multiple lines
#
# test it can read in and translate a braille file that wraps past 80 characters
#
# test it can read in and translate a braille file that wraps to multiple lines
