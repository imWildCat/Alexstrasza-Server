class Api::V1::AccountsController < Api::V1::BaseApiControllerController

  def reg
    new_user_data = params.permit(:nickname, :email, :phone, :password)
    user = User.new new_user_data
    if user.valid?
      user.save
      @user = user
    else
      render_error errors: user.errors
    end
  end

  def login
    user = User.find_by_email params[:email]
    if not user.authenticate params[:password]
      render_error error_code: 104, error_message: '登录失败，Email 或密码错误。'
    else
      user_token = UserToken.make user: user, device: 'default'
      @token = user_token.token
      @user = user
    end
  end

end
