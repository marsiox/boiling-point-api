require 'minitest/autorun'
require_relative '../../app/interactors/temperature_converter'

class TemperatureConverterTest < Minitest::Test
  def test_converts_fahrenheit_to_celsius
    input_temperature = 32.0
    expected_temperature = 0.0

    interactor_call = TemperatureConverter.call(type: :fahrenheit2celsius, value: input_temperature)

    assert_equal expected_temperature, interactor_call.result[:temperature]
  end

  def test_converts_celsius_to_fahrenheit
    input_temperature = 0.0
    expected_temperature = 32.0

    interactor_call = TemperatureConverter.call(type: :celsius2fahrenheit, value: input_temperature)

    assert_equal expected_temperature, interactor_call.result[:temperature]
  end
end
