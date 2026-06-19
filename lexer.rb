module Lexer
  def self.lex(input)
    tokenized_expression = []
    flush = ->(x) { tokenized_expression << x unless x.empty? ; ""}
    current_number = ""

    input.each_char do |c|

      if c == " "
        current_number = flush.call(current_number)

      elsif "0123456789.".include?(c)
        current_number << c

      else "+-/()^*".include?(c)
        current_number = flush.call(current_number)
        tokenized_expression << c
      end
    end

    flush.call(current_number)
        
    tokenized_expression
  end
end
