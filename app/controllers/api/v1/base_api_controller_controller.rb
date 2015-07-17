class Api::V1::BaseApiControllerController < ActionController::API

  include ApiV1Helper

  def render_error(error_const: nil, code: nil, message: nil, errors: nil)
    if error_const.nil?
      @error_code = code
      @error_message = message
      @errors = errors
    else
      @error_code = error_const[:code]
      @error_message = error_const[:message]
    end
    render 'api/v1/error'
  end

  protected

  def current_token
    return nil if request.headers[:token].nil?
    UserToken.find request.headers[:token]
  end

  def current_user
    current_token.user
  end

  def signed_in?
    if current_token.nil?
      return false
    end
    if !!current_user and !current_token.expired?
      true
    else
      false
    end
  end

  def authenticate!
    if !!current_token and current_token.expired?
      render_error error_const: TOKEN_EXPIRED
    end
    unless signed_in?
      render_error error_const: NOT_AUTHORIZED
    end
  end

end
