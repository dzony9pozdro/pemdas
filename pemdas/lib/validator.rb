class Validator
  attr_accessor :tokens

  def initialize(tokens)
    self.tokens = tokens
  end

  def run
    balance = 0
    tokens.each_with_index do |token, index|
      balance += token.balance

      if balance < 0
        warn "Unbalanced token at #{index} #{token.inspect}"
      end
      puts "#{token.raw_token} - #{token.number?}/#{token.operator?}/#{token.bracket?}"
    end
  end

  def self.run(tokens)
    new(tokens).run
  end
end
