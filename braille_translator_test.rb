gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require 'pry'
require_relative 'braille_translator'

class BrailleTranslatorTest < MiniTest::Test

  def setup
    @t = BrailleTranslator.new
  end

  def test_it_can_map_a_letter_to_a_braille_characters
    b = @t.translate_alpha_to_braille("a")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("b")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("c")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("d")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  ".0"
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("e")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  ".0"
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("f")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("g")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("h")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("i")
    assert_equal b[0].first_line,   ".0"
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("j")
    assert_equal b[0].first_line,   ".0"
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("k")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("l")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("m")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("n")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  ".0"
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("o")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  ".0"
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("p")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("q")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("r")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("s")
    assert_equal b[0].first_line,   ".0"
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("t")
    assert_equal b[0].first_line,   ".0"
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("u")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   "00"

    b = @t.translate_alpha_to_braille("v")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   "00"

    b = @t.translate_alpha_to_braille("w")
    assert_equal b[0].first_line,   ".0"
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   ".0"

    b = @t.translate_alpha_to_braille("x")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   "00"

    b = @t.translate_alpha_to_braille("y")
    assert_equal b[0].first_line,   "00"
    assert_equal b[0].second_line,  ".0"
    assert_equal b[0].third_line,   "00"

    b = @t.translate_alpha_to_braille("z")
    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  ".0"
    assert_equal b[0].third_line,   "00"

    b = @t.translate_alpha_to_braille(" ")
    assert_equal b[0].first_line,   ".."
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("!")
    assert_equal b[0].first_line,   ".."
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille("'")
    assert_equal b[0].first_line,   ".."
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   "0."

    b = @t.translate_alpha_to_braille(",")
    assert_equal b[0].first_line,   ".."
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   ".."

    b = @t.translate_alpha_to_braille("-")
    assert_equal b[0].first_line,   ".."
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   "00"

    b = @t.translate_alpha_to_braille(".")
    assert_equal b[0].first_line,   ".."
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   ".0"

    b = @t.translate_alpha_to_braille("?")
    assert_equal b[0].first_line,   ".."
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   "00"

    b = @t.translate_alpha_to_braille("&")
    assert_equal b[0].first_line,   ".."
    assert_equal b[0].second_line,  ".."
    assert_equal b[0].third_line,   ".0"
  end


  def test_it_can_map_multiple_letters_to_braille_characters
    b = @t.translate_alpha_to_braille("bob")

    assert_equal b[0].first_line,   "0."
    assert_equal b[0].second_line,  "0."
    assert_equal b[0].third_line,   ".."

    assert_equal b[1].first_line,   "0."
    assert_equal b[1].second_line,  ".0"
    assert_equal b[1].third_line,   "0."

    assert_equal b[2].first_line,   "0."
    assert_equal b[2].second_line,  "0."
    assert_equal b[2].third_line,   ".."

    b = @t.translate_alpha_to_braille("why not?")
    # b = @t.translate_alpha_to_braille("w")
    assert_equal b[0].first_line,   ".0"
    assert_equal b[0].second_line,  "00"
    assert_equal b[0].third_line,   ".0"


    # b = @t.translate_alpha_to_braille("h")
    assert_equal b[1].first_line,   "0."
    assert_equal b[1].second_line,  "00"
    assert_equal b[1].third_line,   ".."

    # b = @t.translate_alpha_to_braille("y")
    assert_equal b[2].first_line,   "00"
    assert_equal b[2].second_line,  ".0"
    assert_equal b[2].third_line,   "00"

    # b = @t.translate_alpha_to_braille(" ")
    assert_equal b[3].first_line,   ".."
    assert_equal b[3].second_line,  ".."
    assert_equal b[3].third_line,   ".."

    # b = @t.translate_alpha_to_braille("n")
    assert_equal b[4].first_line,   "00"
    assert_equal b[4].second_line,  ".0"
    assert_equal b[4].third_line,   "0."


    # b = @t.translate_alpha_to_braille("o")
    assert_equal b[5].first_line,   "0."
    assert_equal b[5].second_line,  ".0"
    assert_equal b[5].third_line,   "0."


    # b = @t.translate_alpha_to_braille("t")
    assert_equal b[6].first_line,   ".0"
    assert_equal b[6].second_line,  "00"
    assert_equal b[6].third_line,   "0."

    # b = @t.translate_alpha_to_braille("?")
    assert_equal b[7].first_line,   ".."
    assert_equal b[7].second_line,  "0."
    assert_equal b[7].third_line,   "00"
  end

end
