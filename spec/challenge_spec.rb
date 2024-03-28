require "benchmark"
require "pry-byebug"
require "json"

require "./spec_helper.rb"
require "./challenge.rb"

RSpec.describe Challenge do
  let(:challenge) { Challenge.new }

  let(:simple_bench_cache_file) { "simple_bench.json" }

  let(:simple_result_cache_file) { "simple_result.json" }

  let(:measurements_test_file_key) do
    described_class::MEASUREMENTS_FILE_NAME
  end

  let(:cached_perform_simple_total_time) do
    cache = begin
        JSON.parse(File.read(simple_bench_cache_file))
      rescue
        {}
      end

    if cache[measurements_test_file_key].nil?
      cache[measurements_test_file_key] = Benchmark.measure { challenge.perform_simple }.total

      File.open(simple_bench_cache_file, "w") do |file|
        file.write cache.to_json
      end
    end

    cache[measurements_test_file_key]
  end

  it "is correct" do
    expect(challenge.perform_optimised).to eq(challenge.perform_simple)
  end

  it "improves performance" do
    perform_optimised_total_time = Benchmark.measure { challenge.perform_optimised }.total

    improvement_factor = cached_perform_simple_total_time / perform_optimised_total_time

    puts <<~REPORT
           
           Simple:\t\t#{cached_perform_simple_total_time.round(1)}s
      Optimised:\t#{perform_optimised_total_time.round(1)}s
      Improvement:\t#{improvement_factor.round(1)}x
         REPORT

    expect(improvement_factor).to be > 1
  end
end
