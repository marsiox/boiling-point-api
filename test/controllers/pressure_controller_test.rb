require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../../app/controllers/pressure_controller'

class PressureControllerTest < Minitest::Test
  def setup
    @controller = PressureController.new
    @request = mock
    @request.stubs(:params).returns({'hpa' => '1013.25'})
  end

  def test_boiling_point_default_scale
    ENV.stubs(:[]).with('BOILING_POINT_SCALE').returns('celsius')
    status, headers, body = @controller.boiling_point(@request)

    assert_equal 200, status
    assert_equal 'application/json', headers['content-type']
    response = JSON.parse(body.first)
    assert_equal 100.0, response['temperature']
    assert_equal 'celsius', response['scale']
  end
end
