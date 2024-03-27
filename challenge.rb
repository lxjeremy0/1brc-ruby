# frozen_string_literal: true

class Challenge
  def perform_simple
    stations = Hash.new {|hsh, key| hsh[key] = [] }

    File.open("measurements.txt", "r") do |file|
      file.each_line do |line|
        location, temperature = line.chomp.split(';')

        stations[location] << temperature.to_f
      end
    end

    stations_aggregated = stations.transform_values do |measurements|
      min, max = measurements.minmax
      avg = measurements.sum / measurements.size

      [min, avg, max]
    end

    stations_aggregated
  end

  def perform_optimised
    # TODO Improve performance 🚀
    perform_simple
  end
end