module Lexer
  def self.lex(input)
    tokenized_expression = []
    flush = ->(x) { tokenized_expression << x unless x.empty? ; ""}
    current_number = ""
    mystery_chars = ""

    input.each_char do |c|
      if c == " "
        current_number = flush.call(current_number)

      elsif "0123456789.".include?(c)
        current_number << c

      elsif "+-/()^*".include?(c)
        current_number = flush.call(current_number)
        tokenized_expression << c

      else
        mystery_chars << (c)
      end
    end

    current_number = flush.call(current_number)
        
    puts "tf is this: #{mystery_chars}" unless mystery_chars.empty?
    tokenized_expression
  end
end
