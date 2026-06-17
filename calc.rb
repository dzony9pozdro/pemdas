def calc

  print("input op (+ - / *)")
  op = gets.chomp
  
  print("input a: ")
  a = gets.chomp.to_f

  print("input b: ")
  b = gets.chomp.to_f

  case op
    when "+" then a + b
    when "-" then a - b
    when "/" then
      return "div by 0 => undefined" if b.zero?
      a / b
    when "*" then a * b
    else "+-/* are the only valid ops"
  end
end

balls = calc


case balls
when Float then puts balls == balls.floor ? balls.to_i : balls
when Integer then puts balls
else puts "error"
end


