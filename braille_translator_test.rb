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
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("b")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("c")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("d")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("e")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("f")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("g")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("h")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("i")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("j")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("k")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("l")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("m")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("n")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("o")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("p")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("q")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("r")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("s")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("t")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("u")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "00"

    b = @t.translate_alpha_to_braille("v")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "00"

    b = @t.translate_alpha_to_braille("w")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".0"

    b = @t.translate_alpha_to_braille("x")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "00"

    b = @t.translate_alpha_to_braille("y")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   "00"

    b = @t.translate_alpha_to_braille("z")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   "00"

    b = @t.translate_alpha_to_braille(" ")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("!")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille("'")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "0."

    b = @t.translate_alpha_to_braille(",")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    b = @t.translate_alpha_to_braille("-")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "00"

    b = @t.translate_alpha_to_braille(".")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".0"

    b = @t.translate_alpha_to_braille("?")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "00"

    b = @t.translate_alpha_to_braille("&")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   ".0"
  end


  def test_it_can_map_multiple_letters_to_braille_characters
    b = @t.translate_alpha_to_braille("bob")

    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    assert_equal b[1][0],   "0."
    assert_equal b[1][1],  ".0"
    assert_equal b[1][2],   "0."

    assert_equal b[2][0],   "0."
    assert_equal b[2][1],  "0."
    assert_equal b[2][2],   ".."

    b = @t.translate_alpha_to_braille("why not?")
    # b = @t.translate_alpha_to_braille("w")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".0"


    # b = @t.translate_alpha_to_braille("h")
    assert_equal b[1][0],   "0."
    assert_equal b[1][1],  "00"
    assert_equal b[1][2],   ".."

    # b = @t.translate_alpha_to_braille("y")
    assert_equal b[2][0],   "00"
    assert_equal b[2][1],  ".0"
    assert_equal b[2][2],   "00"

    # b = @t.translate_alpha_to_braille(" ")
    assert_equal b[3][0],   ".."
    assert_equal b[3][1],  ".."
    assert_equal b[3][2],   ".."

    # b = @t.translate_alpha_to_braille("n")
    assert_equal b[4][0],   "00"
    assert_equal b[4][1],  ".0"
    assert_equal b[4][2],   "0."


    # b = @t.translate_alpha_to_braille("o")
    assert_equal b[5][0],   "0."
    assert_equal b[5][1],  ".0"
    assert_equal b[5][2],   "0."


    # b = @t.translate_alpha_to_braille("t")
    assert_equal b[6][0],   ".0"
    assert_equal b[6][1],  "00"
    assert_equal b[6][2],   "0."

    # b = @t.translate_alpha_to_braille("?")
    assert_equal b[7][0],   ".."
    assert_equal b[7][1],  "0."
    assert_equal b[7][2],   "00"
  end

end
