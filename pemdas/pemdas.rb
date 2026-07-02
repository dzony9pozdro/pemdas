#!/usr/bin/env ruby

require_relative 'lib/lexer'
require_relative 'lib/validator'

STDIN.each_line do |line|
  tokens = Lexer.run(line.strip)
  puts tokens.inspect

  puts tokens.map(&:balance).inspect
  puts tokens.map(&:balance).reduce(:+)

  Validator.run(tokens)
end
