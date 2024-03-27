require 'benchmark'

require './spec_helper.rb'
require './challenge.rb'

RSpec.describe Challenge do
  let(:challenge) { Challenge.new }

  it 'is correct' do
    expect(challenge.perform_optimised).to eq(challenge.perform_simple)
  end

  it 'goes fast' do
    Benchmark.bmbm do |bench|
      bench.report("simple    🐌") { challenge.perform_simple }
      bench.report("optimised 🚀") { challenge.perform_optimised }
    end
  end
end