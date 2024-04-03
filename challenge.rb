# frozen_string_literal: true

class Challenge
  MEASUREMENTS_FILE_NAME = 'measurements_test.txt'

  def perform_simple
    stations = Hash.new {|hsh, key| hsh[key] = [] }

    File.open(MEASUREMENTS_FILE_NAME, "r") do |file|
      file.each_line do |line|
        location, temperature = line.chomp.split(';')

        stations[location] << temperature.to_f
      end
    end

    stations_aggregated = stations.transform_values do |measurements|
      min, max = measurements.minmax
      avg = (measurements.sum / measurements.size).round(1)

      [min, avg, max]
    end

    stations_aggregated
  end

  def perform_optimised
    # TODO Improve performance 🚀
    perform_simple
  end
end