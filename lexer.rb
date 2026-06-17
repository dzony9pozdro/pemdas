def lex(input)
  tokenized_expression = []
  flush = ->(x) { tokenized_expression << x unless x.empty? ; ""}
  star_op = ""
  current_number = ""
  mystery_chars = ""

  input.each_char do |c|
    if c == " "
      current_number = flush.call(current_number)
      star_op = flush.call(star_op)

    elsif "0123456789.".include?(c)
      star_op = flush.call(star_op)
      current_number << c

    elsif "+-/()".include?(c)
      current_number = flush.call(current_number)
      star_op = flush.call(star_op)
      tokenized_expression << c

    elsif c == "*"
      star_op << "*"
      current_number = flush.call(current_number)

    else
      mystery_chars << (c)
      puts "tf is this: #{mystery_chars}"

    end
  end

  current_number = flush.call(current_number)
  star_op = flush.call(star_op)
      
  tokenized_expression
end
