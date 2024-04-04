require "benchmark"
require "pry-byebug"
require "json"

require "./spec_helper.rb"
require "./challenge.rb"

RSpec.describe Challenge do
  let(:challenge) { Challenge.new }

  let(:measurements_test_file_key) do
    described_class::MEASUREMENTS_FILE_NAME
  end

  def get_via_cache(path, key, &block)
    cache = begin
      JSON.parse(File.read(path))
    rescue
      {}
    end

    if cache[key].nil?
      cache[key] = yield

      File.open(path, "w") do |file|
        file.write cache.to_json
      end
    end

    cache[key]
  end

  let(:cached_perform_simple_result) do
    get_via_cache("#{File.basename(measurements_test_file_key, '.txt')}.simple_result.json", measurements_test_file_key) do
      challenge.perform_simple
    end
  end

  let(:cached_perform_simple_total_time) do
    get_via_cache("#{File.basename(measurements_test_file_key, '.txt')}.simple_bench.json", measurements_test_file_key) do
      Benchmark.measure { challenge.perform_simple }.total
    end
  end

  let(:perform_optimised) do
    result = nil
    
    bench = Benchmark.measure do
      result = challenge.perform_optimised
    end

    {
      total: bench.total,
      result: result,
    }
  end

  it "is correct" do
    expect(perform_optimised[:result]).to eq(cached_perform_simple_result)
  end

  it "improves performance" do
    perform_optimised_total_time = perform_optimised[:total]

    improvement_factor = cached_perform_simple_total_time / perform_optimised_total_time

    puts <<~REPORT
           
      Simple:\t\t#{cached_perform_simple_total_time.round(1)}s
      Optimised:\t#{perform_optimised_total_time.round(1)}s
      Improvement:\t#{improvement_factor.round(1)}x
    REPORT

    expect(improvement_factor).to be > 1
  end
end
