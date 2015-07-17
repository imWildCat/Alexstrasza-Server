module ApiV1Helper

  ###############
  # error codes #
  ###############

  # Registration
  USER_NICKNAME_EXISTS = {:code => 1001, :message => '无法注册，昵称已存在'}
  USER_EMAIL_EXISTS =  {:code => 1002, :message => '无法注册，Email 已存在'}

  # Logging in
  LOGIN_FAILED =  {:code => 2001, :message => '登录失败，账号或密码错误'}

  # Session
  NOT_AUTHORIZED = {:code => 401, :message => '您尚未登录，请登录'}
  TOKEN_EXPIRED = {:code => 2101, :message => '登录已过期'}

end
