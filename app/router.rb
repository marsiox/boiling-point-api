Dir[File.join(__dir__, 'controllers', '*.rb')].each { |file| require_relative file }

class Router
  ROUTES = {
    '/' => ->(req) { HomeController.new.index(req) },
    '/temp/c2f' => ->(req) { TemperatureController.new.celsius2fahrenheit(req) },
    '/temp/f2c' => ->(req) { TemperatureController.new.fahrenheit2celsius(req) },
    '/pressure/boiling-point' => ->(req) { PressureController.new.boiling_point(req) }
  }.freeze

  def call(env)
    req = Rack::Request.new(env)
    route = ROUTES[req.path_info]

    if route
      route.call(req)
    else
      [404, { "content-type" => "application/json" }, [{ message: 'Not found' }.to_json]]
    end
  end
end
