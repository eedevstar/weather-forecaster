require 'test_helper'

class WeatherServiceTest < ActiveSupport::TestCase

  test "call openweathermap with latitude and logitude parameters" do
    # Example address is 1 Twins Way, Minneapolis
    latitude = 44.98168445
    longitude = -93.27786434576453
    weather = WeatherService.call(latitude, longitude)
    assert_includes -4..44, weather.temperature
    assert_includes -4..44, weather.temperature_min
    assert_includes -4..44, weather.temperature_max
    assert_includes 0..100, weather.humidity
    assert_includes 900..1100, weather.pressure
    refute_empty weather.description
  end

end
