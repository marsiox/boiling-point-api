require 'json'
require_relative './base_controller'
require_relative '../interactors/temperature_converter'

class TemperatureController < BaseController
  def celsius2fahrenheit(req)
    fahrenheit = TemperatureConverter.call(value: req.params['value'].to_f, type: 'celsius2fahrenheit').
      result[:temperature]

    render_json({ fahrenheit: fahrenheit })
  end

  def fahrenheit2celsius(req)
    celsius = TemperatureConverter.call(value: req.params['value'].to_f, type: 'fahrenheit2celsius').
      result[:temperature]

    render_json({ celsius: celsius })
  end
end
