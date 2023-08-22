require 'minitest/autorun'
require_relative '../../app/interactors/pressure_point'

class PressurePointTest < Minitest::Test
  def test_calculates_standard_boiling_point
    input_hpa = 1013.25
    expected_temperature = 100.0

    assert_equal expected_temperature, PressurePoint.call(hpa: input_hpa).result[:temperature]
  end

  def test_calculates_lower_boiling_point
    input_hpa = 800
    expected_temperature = 93.53

    assert_equal expected_temperature, PressurePoint.call(hpa: input_hpa).result[:temperature]
  end
end
