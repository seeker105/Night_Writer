require_relative 'char'

class BrailleTranslator

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
    @braille_to_alpha_hash = @alpha_to_braille_hash.invert
    # puts @braille_to_alpha_hash
    # puts "\n\n\n"
    # puts @alpha_to_braille_hash
    #
    # puts "\n\n\n"
    # puts @alpha_to_braille_hash["a"]
    #
    # puts "\n\n\n"
    #   x = @alpha_to_braille_hash["a"]
    #   y = @alpha_to_braille_hash["a"]
    # puts x.equal(y)
  end # of initialize

  def alpha_to_braille(alpha_string)
    #alpha_string.map { |letter| @alpha_to_braille_hash[letter] }
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


end # of class

if __FILE__ == $0
b = BrailleTranslator.new
b.alpha_to_braille(" ")




end
