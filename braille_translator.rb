require_relative 'char'

class BrailleTranslator

  def initialize
    @alpha_to_braille = {
      "a" => Char.new("0.",
                      "..",
                      ".."),
      "b" => Char.new("0.",
                      "0.",
                      ".."),
      "c" => Char.new("00",
                      "..",
                      ".."),
      "d" => Char.new("00",
                      ".0",
                      ".."),
      "e" => Char.new("0.",
                      ".0",
                      ".."),
      "f" => Char.new("00",
                      "0.",
                      ".."),
      "g" => Char.new("00",
                      "00",
                      ".."),
      "h" => Char.new("0.",
                      "00",
                      ".."),
      "i" => Char.new(".0",
                      "0.",
                      ".."),
      "j" => Char.new(".0",
                      "00",
                      ".."),
      "k" => Char.new("0.",
                      "..",
                      "0."),
      "l" => Char.new("0.",
                      "0.",
                      "0."),
      "m" => Char.new("00",
                      "..",
                      "0."),
      "n" => Char.new("00",
                      ".0",
                      "0."),
      "o" => Char.new("0.",
                      ".0",
                      "0."),
      "p" => Char.new("00",
                      "0.",
                      "0."),
      "q" => Char.new("00",
                      "00",
                      "0."),
      "r" => Char.new("0.",
                      "00",
                      "0."),
      "s" => Char.new(".0",
                      "0.",
                      "0."),
      "t" => Char.new(".0",
                      "00",
                      "0."),
      "u" => Char.new("0.",
                      "..",
                      "00"),
      "v" => Char.new("0.",
                      "0.",
                      "00"),
      "w" => Char.new(".0",
                      "00",
                      ".0"),
      "x" => Char.new("00",
                      "..",
                      "00"),
      "y" => Char.new("00",
                      ".0",
                      "00"),
      "z" => Char.new("0.",
                      ".0",
                      "00"),
      " " => Char.new("..",
                      "..",
                      ".."),
      "!" => Char.new("..",
                      "00",
                      "0."),
      "'" => Char.new("..",
                      "..",
                      "0."),
      "," => Char.new("..",
                      "0.",
                      ".."),
      "-" => Char.new("..",
                      "..",
                      "00"),
      "." => Char.new("..",
                      "00",
                      ".0"),
      "?" => Char.new("..",
                      "0.",
                      "00"),
      "&" => Char.new("..",
                      "..",
                      ".0")
    }
    # @braille_to_alpha = @alpha_to_braille.invert
    # puts @braille_to_alpha
    # puts "\n\n\n"
    # puts @alpha_to_braille
    #
    # puts "\n\n\n"
    # puts @alpha_to_braille["a"]
    #
    # puts "\n\n\n"
    #   x = @alpha_to_braille["a"]
    #   y = @alpha_to_braille["a"]
    # puts x.equal(y)
  end # of initialize

  def translate_alpha_to_braille(input)
    # input.map { |letter| @alpha_to_braille[letter] }
    output = []
    input.each_char do |chr|
      output << @alpha_to_braille[chr]
    end
    return output
  end


end # of class

b = BrailleTranslator.new
