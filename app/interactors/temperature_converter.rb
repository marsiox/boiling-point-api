require 'interactor'

class TemperatureConverter
  include Interactor

  def call
    context.result = { temperature: send(context.type) }
  end

  private

  def fahrenheit2celsius
    ((context.value - 32) * 5/9).round(2)
  end

  def celsius2fahrenheit
    ((context.value * 9/5) + 32).round(2)
  end
end