class WeatherStation
  attr_reader :location, :mean_temperature

  STANDARD_DEVIATION = 10

  def initialize(location, mean_temperature)
    @location = location
    @mean_temperature = mean_temperature
  end

  # random gaussian
  def measurement
    (self.class.random_normal_gausian * STANDARD_DEVIATION + mean_temperature).round(1)
  end

  # The Marsaglia polar method
  def self.random_normal_gausian
    begin
      v1 = 2.0 * Random.rand - 1.0
      v2 = 2.0 * Random.rand - 1.0
      s = v1 * v1 + v2 * v2
    end while s >= 1.0 || s == 0
    s = Math.sqrt((-2.0 * Math.log(s)) / s)
    v1 * s
  end
end

# test
# puts WeatherStation.new('hola', 10.0).measurement
