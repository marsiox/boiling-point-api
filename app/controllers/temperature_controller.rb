require 'json'
require_relative '../interactors/temperature_converter'

class TemperatureController
  def celsius2fahrenheit(req)
    fahrenheit = TemperatureConverter.call(value: req.params['value'].to_f, type: 'celsius2fahrenheit').
      result[:temperature]

    [200, { "content-type" => "application/json" }, [{ fahrenheit: fahrenheit }.to_json]]
  end

  def fahrenheit2celsius(req)
    celsius = TemperatureConverter.call(value: req.params['value'].to_f, type: 'fahrenheit2celsius').
      result[:temperature]

    [200, { "content-type" => "application/json" }, [{ celsius: celsius }.to_json]]
  end
end
