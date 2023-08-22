require 'json'

class HomeController
  def index(_req)
    [200, { "content-type" => "application/json" }, [{ version: '1.0.0' }.to_json]]
  end
end
