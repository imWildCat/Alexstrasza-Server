json.user do
  json.nickname @user.nickname
  json.email @user.email
  json.created_at @user.created_at
end

json.token @token