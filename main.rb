def compute(frag) #gets passed an array with no parens, has to evaluate order of computation () ^ */ +-

  frag.each_with_index do |token, i| 

  case  token 
  when "^"
 #   check for chain of expressions like: x^y^z, then x^(y^z)
    chain_start = i-1 if chain_start.empty?
  # curr_chain << frag[i-1]

  when "*","/" then "rolling product, return it as one token upon encountering an op other than * or /"



  when "+","-" then "rolling sum/diff, calculated after all other operations are completed"
 
  end
end
  
  "#{frag} => computed fragment"

end

def parse
  require_relative 'lexer'
  expression = Lexer.lex("2^2*3(2^2)")
  paren_indices = []

  i=0
  while i < expression.length 
  # expression.each_with_index do |token, i| 

    #FIX:
    #tokens like 1.2.3.....45. ^^^ ***** +++++ ---- all get parsed, will brick computation, need to implement validation
    #also if a num is followed by l paren insert * there 

    case token when "("
      paren_indices << i

    when ")"  # find matching l paren upon each r paren encounter, eval
      frag = expression[paren_indices.last+1 .. i-1] # selects the fragment enclosed in parens, exclusively
      expression[paren_indices.last .. i] = [compute(frag)] # replaces the fragment enclosed in parens, inclusively, with the result of compute()
      paren_indices.pop #removes l paren from the stack
      paren_indices.empty? ? i = 0 : i = paren_indices.last  #jumps to previous l paren occurence - effectively moving up one level in depth, restarting the process
      frag = []
    else frag << token
    end
  i+=1
  end
  expression = [compute(frag)]
end


parse
