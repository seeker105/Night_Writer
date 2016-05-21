require_relative 'char'

class BrailleTranslator

  attr_reader :alpha_to_braille_contractions_hash

  def initialize
    @alpha_to_braille_hash = {
              "a" => ["0.",
                      "..",
                      ".."],
              "b" => ["0.",
                      "0.",
                      ".."],
              "c" => ["00",
                      "..",
                      ".."],
                      "c" => "00...."
              "d" => ["00",
                      ".0",
                      ".."],
              "e" => ["0.",
                      ".0",
                      ".."],
              "f" => ["00",
                      "0.",
                      ".."],
              "g" => ["00",
                      "00",
                      ".."],
              "h" => ["0.",
                      "00",
                      ".."],
              "i" => [".0",
                      "0.",
                      ".."],
              "j" => [".0",
                      "00",
                      ".."],
              "k" => ["0.",
                      "..",
                      "0."],
              "l" => ["0.",
                      "0.",
                      "0."],
              "m" => ["00",
                      "..",
                      "0."],
              "n" => ["00",
                      ".0",
                      "0."],
              "o" => ["0.",
                      ".0",
                      "0."],
              "p" => ["00",
                      "0.",
                      "0."],
              "q" => ["00",
                      "00",
                      "0."],
              "r" => ["0.",
                      "00",
                      "0."],
              "s" => [".0",
                      "0.",
                      "0."],
              "t" => [".0",
                      "00",
                      "0."],
              "u" => ["0.",
                      "..",
                      "00"],
              "v" => ["0.",
                      "0.",
                      "00"],
              "w" => [".0",
                      "00",
                      ".0"],
              "x" => ["00",
                      "..",
                      "00"],
              "y" => ["00",
                      ".0",
                      "00"],
              "z" => ["0.",
                      ".0",
                      "00"],
              " " => ["..",
                      "..",
                      ".."],
              "!" => ["..",
                      "00",
                      "0."],
              "'" => ["..",
                      "..",
                      "0."],
              "," => ["..",
                      "0.",
                      ".."],
              "-" => ["..",
                      "..",
                      "00"],
              "." => ["..",
                      "00",
                      ".0"],
              "?" => ["..",
                      "0.",
                      "00"],
              "&" => ["..",
                      "..",
                      ".0"],
              "#" => [".0",
                      ".0",
                      "00"]
    }

    @alpha_contraction_to_word_hash = {
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

    @alpha_to_braille_contractions_hash = {
                  "a" => ["0.", # a
                          "..",
                          ".."],
                  "b" => ["0.", # but
                          "0.",
                          ".."],
                  "c" => ["00", # can
                          "..",
                          ".."],
                  "d" => ["00", # do
                          ".0",
                          ".."],
                  "e" => ["0.", # every
                          ".0",
                          ".."],
                  "f" => ["00", # from
                          "0.",
                          ".."],
                  "g" => ["00", # go
                          "00",
                          ".."],
                  "h" => ["0.", # have
                          "00",
                          ".."],
                  "i" => ["..", # in
                          ".0",
                          "0."],
                  "j" => [".0", # just
                          "00",
                          ".."],
                  "k" => ["0.", # knowledge
                          "..",
                          "0."],
                  "l" => ["0.", # like
                          "0.",
                          "0."],
                  "m" => ["00", # more
                          "..",
                          "0."],
                  "n" => ["00", # not
                          ".0",
                          "0."],
                  "o" => ["0.", # out
                          "00",
                          ".0"],
                  "p" => ["00", # people
                          "0.",
                          "0."],
                  "q" => ["00",  # quite
                          "00",
                          "0."],
                  "r" => ["0.", # rather
                          "00",
                          "0."],
                  "s" => [".0", # so
                          "0.",
                          "0."],
                  "t" => [".0", # that
                          "00",
                          "0."],
                  "u" => ["0.", # us
                          "..",
                          "00"],
                  "v" => ["0.", # very
                          "0.",
                          "00"],
                  "w" => [".0", # will
                          "00",
                          ".0"],
                  "x" => ["00", # it
                          "..",
                          "00"],
                  "y" => ["00", # you
                          ".0",
                          "00"],
                  "z" => ["0.", # as
                          ".0",
                          "00"],
                  "C" => ["0.", # child
                          "..",
                          ".0"],
                  "S" => ["00", # shall
                          "..",
                          ".0"],
                  "T" => ["00", # this
                          ".0",
                          ".0"],
                  "W" => ["0.", # which
                          ".0",
                          ".0"],
                  "E" => ["..", # enough
                          "0.",
                          ".0"],
                  "B" => ["..", # were
                          "00",
                          "00"]
        }

    @braille_to_alpha_hash = @alpha_to_braille_hash.invert
    @braille_to_alpha_contractions_hash = @alpha_to_braille_contractions_hash.invert
    @alpha_word_to_contraction_hash = @alpha_contraction_to_word_hash.invert
  end # of initialize

  def alpha_to_braille(alpha_string)
    output = []
    alpha_string.each_char do |character|
      output << @alpha_to_braille_hash[character]
    end
    return output
  end

  def braille_to_alpha(braille_char_array)
    output = ""
    braille_char_array.each do |braille_char|
      output += @braille_to_alpha_hash[braille_char]
    end
    return output
  end

  def is_word_contraction?(word)
    @alpha_word_to_contraction_hash.include?(word)
  end

  def is_character_contraction?(character)
    @alpha_contraction_to_word_hash.include?(character)
  end

  def convert_word_to_contraction(word)
    if is_word_contraction?(word)
      return @alpha_word_to_contraction_hash[word]
    else
      return word
    end
  end

  def convert_contraction_to_word(character)
    if is_character_contraction?(character)
      @alpha_contraction_to_word_hash[character]
    else
      return character
    end
  end


end # of class

if __FILE__ == $0
b = BrailleTranslator.new
b.alpha_to_braille(" ")


x = b.alpha_to_braille_contractions_hash["a"]

puts x
puts "\n"

y = b.braille_to_alpha([x])
puts y

end
