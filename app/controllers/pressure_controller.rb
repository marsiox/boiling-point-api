require 'json'
require_relative './base_controller'
require_relative '../interactors/pressure_point'
require_relative '../interactors/temperature_converter'

class PressureController < BaseController
  def boiling_point(req)
    scale = ENV['BOILING_POINT_SCALE']
    t = PressurePoint.call(hpa: req.params['hpa'].to_f).result[:temperature]

    if scale == 'fahrenheit'
      t = TemperatureConverter.call(value: t, type: 'celsius2fahrenheit').result[:temperature]
    end

    result = { temperature: t.round(2), scale: scale }

    render_json(result)
  end
end
