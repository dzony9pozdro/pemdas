class Lexer
  attr_accessor :input, :current_number

  class Token
    attr_accessor :raw_token

    def initialize(raw_token)
      self.raw_token = raw_token
    end

    def inspect
      "<#{self.class} #{raw_token.inspect}>"
    end

    def number?
      false
    end

    def operator?
      false
    end

    def bracket?
      false
    end

    def unknown?
      false
    end

    def balance
      0
    end
  end

  class UnknownToken < Token
    def unknown?
      true
    end
  end

  class Number < Token
    def number?
      true
    end
  end

  class Operator < Token
    def operator?
      true
    end
  end

  class Bracket < Token
    def bracket?
      true
    end

    def balance
      if left?
        1
      else
        -1
      end
    end

    def left?
      raw_token == "("
    end

    def right?
      raw_token == ")"
    end
  end

  def initialize(input)
    self.input = input
    self.current_number = ""
  end

  def run
    parse
    tokens
  end

  def parse
    inside_number = false
    input.each_char do |char|
      case char
      when " "
        flush
      when /\d|[.]/
        flush unless inside_number?
        current_number << char
      when /[+-\/^*]/
        flush if inside_number?
        tokens << Operator.new(char)
      when /[()]/
        flush if inside_number?
        tokens << Bracket.new(char)
      else
        flush
        tokens << UnknownToken.new(char)
        warn "Unknown token #{char.inspect}"
      end
    end

    flush
  end

  def inside_number?
    current_number != ""
  end

  def flush
    return unless inside_number?
    tokens << Number.new(current_number)
    self.current_number = ""
  end

  def tokens
    @tokens ||= []
  end

  def self.run(input)
    new(input).run
  end
end

if __FILE__ == $0
  tokens = Lexer.run("12.22 * 22.11 + (10*12)")
  puts "Tokens:"
  puts tokens.inspect
  puts "Numbers:"
  puts tokens.select(&:number?).inspect
  puts "Brackets:"
  puts tokens.select(&:bracket?).inspect
end
