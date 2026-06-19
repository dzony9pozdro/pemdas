require_relative "lexer"

module Validator
  def self.check(input)
    paren_depth = 0
    errors = []
    
    tokens = Lexer.lex(input)
    expression = []

    tokens.each_with_index do |token,i|


      case token

      when /\A[0-9]+(\.[0-9]+)?\z/ then expression << [:number, token.to_f]
      when /\A[-+*\/^]\z/ then expression << [:operator, token]
      when "(" 
        expression << [:l_paren, token]
        paren_depth+=1
      when ")" 
        expression << [:r_paren, token]
        paren_depth-=1

        errors << "stray ) at index #{i}" if paren_depth < 0 
        
      else 
        errors << "#{token.inspect} at i: #{i}"
      end
    end

    unless paren_depth == 0
      errors << "mismatched parens"
    end

    unless errors.empty?
      raise "invalid - errors: #{errors.join(", ")}"
    end

  expression
  end
end
