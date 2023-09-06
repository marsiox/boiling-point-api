class BaseController
  def render_json(data, status = 200)
    [status, { "content-type" => "application/json" }, [data.to_json]]
  end
end
