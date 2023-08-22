require 'interactor'

class PressurePoint
  include Interactor

  # Constants for water based on the Antoine equation
  A = 8.07131
  B = 1730.63
  C = 233.426

  def call
    context.result = { temperature: boiling_point_of_water }
  end

  private

  def boiling_point_of_water
    # Antoine equation to calculate boiling point at given pressure
    # log10(P) = A - (B / (T + C))
    # Where P is the vapor pressure in mmHg
    # Convert hPa to mmHg
    pressure_mmhg = context.hpa * 0.750062
    t = B / (A - Math.log10(pressure_mmhg)) - C
    t.round(2)
  end
end
