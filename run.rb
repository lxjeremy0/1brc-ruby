require './challenge.rb'

result = Challenge.new.perform_optimised

if ARGV[0] == '--show'
  pp result
end
