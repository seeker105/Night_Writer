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
    b = @t.alpha_to_braille("a")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("b")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("c")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("d")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("e")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("f")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("g")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("h")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("i")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("j")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("k")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("l")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("m")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("n")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("o")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("p")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("q")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("r")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("s")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("t")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("u")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "00"

    b = @t.alpha_to_braille("v")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "00"

    b = @t.alpha_to_braille("w")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".0"

    b = @t.alpha_to_braille("x")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "00"

    b = @t.alpha_to_braille("y")
    assert_equal b[0][0],   "00"
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   "00"

    b = @t.alpha_to_braille("z")
    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   ".0"
    assert_equal b[0][2],   "00"

    b = @t.alpha_to_braille(" ")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("!")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille("'")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "0."

    b = @t.alpha_to_braille(",")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    b = @t.alpha_to_braille("-")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   "00"

    b = @t.alpha_to_braille(".")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".0"

    b = @t.alpha_to_braille("?")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   "00"

    b = @t.alpha_to_braille("&")
    assert_equal b[0][0],   ".."
    assert_equal b[0][1],   ".."
    assert_equal b[0][2],   ".0"
  end


  def test_it_can_map_multiple_letters_to_braille_characters
    b = @t.alpha_to_braille("bob")

    assert_equal b[0][0],   "0."
    assert_equal b[0][1],   "0."
    assert_equal b[0][2],   ".."

    assert_equal b[1][0],   "0."
    assert_equal b[1][1],   ".0"
    assert_equal b[1][2],   "0."

    assert_equal b[2][0],   "0."
    assert_equal b[2][1],   "0."
    assert_equal b[2][2],   ".."

    b = @t.alpha_to_braille("why not?")
    # b = @t.alpha_to_braille("w")
    assert_equal b[0][0],   ".0"
    assert_equal b[0][1],   "00"
    assert_equal b[0][2],   ".0"


    # b = @t.alpha_to_braille("h")
    assert_equal b[1][0],   "0."
    assert_equal b[1][1],   "00"
    assert_equal b[1][2],   ".."

    # b = @t.alpha_to_braille("y")
    assert_equal b[2][0],   "00"
    assert_equal b[2][1],   ".0"
    assert_equal b[2][2],   "00"

    # b = @t.alpha_to_braille(" ")
    assert_equal b[3][0],   ".."
    assert_equal b[3][1],   ".."
    assert_equal b[3][2],   ".."

    # b = @t.alpha_to_braille("n")
    assert_equal b[4][0],   "00"
    assert_equal b[4][1],   ".0"
    assert_equal b[4][2],   "0."


    # b = @t.alpha_to_braille("o")
    assert_equal b[5][0],   "0."
    assert_equal b[5][1],   ".0"
    assert_equal b[5][2],   "0."


    # b = @t.alpha_to_braille("t")
    assert_equal b[6][0],   ".0"
    assert_equal b[6][1],   "00"
    assert_equal b[6][2],   "0."

    # b = @t.alpha_to_braille("?")
    assert_equal b[7][0],   ".."
    assert_equal b[7][1],   "0."
    assert_equal b[7][2],   "00"
  end

  def test_it_can_map_a_braille_character_to_a_letter
    b = [["0.", "..", ".."]]

    letter = @t.braille_to_alpha(b)
    assert_equal "a", letter
  end

  def test_it_can_map_multiple_braille_characters_to_letters
    b = [[".0","00",".0"],["0.","00",".."],["00",".0","00"],["..","..",".."],["00",".0","0."],["0.",".0","0."],[".0","00","0."],["..","0.","00"]]

    string = @t.braille_to_alpha(b)
    assert_equal "why not?", string
  end

  def test_it_returns_true_if_a_word_has_a_contraction_match
    hash = {
              "a" => "a",
              "b" => "but",
              "c" => "can",
              "d" => "do",
              "e" => "every",
              "f" => "from",
              "g" => "go",
              "h" => "have",
              "i" => "in",
              "j" => "just",
              "k" => "knowledge",
              "l" => "like",
              "m" => "more",
              "n" => "not",
              "o" => "out",
              "p" => "people",
              "q" => "quite",
              "r" => "rather",
              "s" => "so",
              "t" => "that",
              "u" => "us",
              "v" => "very",
              "w" => "will",
              "x" => "it",
              "y" => "you",
              "z" => "as",
              "C" => "child",
              "S" => "shall",
              "T" => "this",
              "W" => "which",
              "E" => "enough",
              "B" => "were"
    }

    hash.each do |pair|
      assert @t.is_word_contraction?(pair[1])
    end

    refute @t.is_word_contraction?("smile")
  end

  def test_it_returns_true_if_a_letter_has_a_word_contraction_match
    hash = {
              "a" => "a",
              "b" => "but",
              "c" => "can",
              "d" => "do",
              "e" => "every",
              "f" => "from",
              "g" => "go",
              "h" => "have",
              "i" => "in",
              "j" => "just",
              "k" => "knowledge",
              "l" => "like",
              "m" => "more",
              "n" => "not",
              "o" => "out",
              "p" => "people",
              "q" => "quite",
              "r" => "rather",
              "s" => "so",
              "t" => "that",
              "u" => "us",
              "v" => "very",
              "w" => "will",
              "x" => "it",
              "y" => "you",
              "z" => "as",
              "C" => "child",
              "S" => "shall",
              "T" => "this",
              "W" => "which",
              "E" => "enough",
              "B" => "were"
    }

    hash.each do |pair|
      assert @t.is_character_contraction?(pair[0])
    end

    refute @t.is_character_contraction?("!")
    refute @t.is_character_contraction?(".")
  end

  def test_it_takes_a_letter_contraction_and_returns_the_word
    assert_equal "from", @t.convert_contraction_to_word("f")
  end

  def test_it_takes_a_word_and_returns_the_contracted_letter
    assert_equal "f", @t.convert_word_to_contraction("from")
  end

  def test_if_it_tries_to_convert_a_non_contraction_word_it_returns_the_word
    assert_equal "rose", @t.convert_word_to_contraction("rose")
  end

  def test_if_it_tries_to_convert_a_non_contraction_character_it_returns_the_character
    assert_equal "!", @t.convert_contraction_to_word("!")
  end


end
