module Ball
  def hi()
    puts "pozdro600"
  end
end
class Ronaldo
  include Ball
end


cypek = Ronaldo.new
cypek.hi

