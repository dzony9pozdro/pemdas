# chain being an array of symbols like "1","^","2","^","3"
bases = chain.reject { |t| t == "^" }
bases_f = bases.map(&:to_f)
bases_f.reverse.reduce { |acc, b| b**acc }

#got rid of the bullshit, would be a bigger pain to wire up with the new validator than to just rewrite it, keeping the power tower formula
