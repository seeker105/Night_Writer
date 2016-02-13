require_relative 'char'

class BrailleTranslator2

  def initialize
    @alpha_to_braille = {
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
                      ".0"]
    }
    @braille_to_alpha = @alpha_to_braille.invert
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
    input.length > 1 ? input.rstrip : 
    input.each_char do |chr|
      output << @alpha_to_braille[chr]
    end
    return output
  end


end # of class


b = BrailleTranslator2.new
b.translate_alpha_to_braille(" ") =>
# !> /Users/christopher1/Night_Writer/bt2.rb:128: syntax error, unexpected tIDENTIFIER, expecting ':'
# !>     input.each_char do |chr|
# !>          ^
# !> /Users/christopher1/Night_Writer/bt2.rb:139: syntax error, unexpected =>, expecting end-of-input
# !> b.translate_alpha_to_braille(" ") =>
# !>                                     ^
# !> /Users/christopher1/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib/seeing_is_believing/event_stream/producer.rb:97:in `record_exception': undefined method `size' for nil:NilClass (NoMethodError)
# !> \tfrom /Users/christopher1/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib/seeing_is_believing/the_matrix.rb:40:in `block in <top (required)>'
