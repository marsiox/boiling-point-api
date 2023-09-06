require 'json'
require_relative './base_controller'

class HomeController < BaseController
  def index(_req)
    data = { version: '1.0.0' }
    render_json(data)
  end
end
