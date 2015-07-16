class Api::V1::BaseApiControllerController < ActionController::API

  def render_error(code: nil, messages: nil, errors: nil)
    @error_code = code
    @error_message = messages
    @errors = errors
    render 'api/v1/error'
  end

end
