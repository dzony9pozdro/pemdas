def parse
  require_relative 'lexer'
  expression = Lexer.lex("2^2*3(2^2)")
  paren_depth = 0
  paren_indices = []


  expression.each_with_index do |token, i| case token when "("
      paren_depth+=1 #increment depth upon left paren encounter
      paren_indices << i #save the index to make life easier for eval

    when ")"  # find matching l paren upon each r paren encounter, eval, decrement depth
      
      frag = expression[paren_indices.last+1 .. i-1]
      expression[paren_indices.last .. i] = [compute(frag)]
      paren_indices.pop
    end
  end
end

def compute(frag)
  #evaluates deepest fragments of the expression recursively
  result
end
