# Alexstrasza

An English learning system built with Rails.
[Alexstrasza](http://wowwiki.wikia.com/Alexstrasza) is a dragon, as the guardian of all life in World of Warcraft, a computer game produced by Blizzard.

# API Document

We mainly support RESTful API, here are details:

> **Notice:**   
> 1. The version number of all the following APIs is 1, so they begin with a prefix `/api/v1`. For example, `/account/reg` means `/api/v1/account/reg`.  
> 2. We are using token-based [RBAC](https://en.wikipedia.org/wiki/Role-based_access_control)(Role-based access control) in this application. You must post `email` & `password` to `/account/login` to get a `token`. Then add the token to `token` field of HTTP header.

## Error response

There are 3 parts of an error response: code, message and details. 
 
```json
{  
  "errors": {
    "code": 1001,  
    "message": "昵称已存在",
    "details": {
      "nickname": [ "已经被使用" ]
    }
  }
}
```

Here are some of the error codes:

```ruby
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
```

For more details, plesase visit [api\_v1_helper.rb](https://github.com/imWildCat/Alexstrasza-Server/blob/master/app/helpers/api_v1_helper.rb) .

## Account

> This part includes: registration, logging in.

### Registration

```
/account/reg
```
Parameter|Description
---|---
nickname|Nickname
email|Email
password|Password

**Positive Response:**

```json
{
  "user": {
    "nickname": "WildCat",
    "email": "foo@bar.com",
  }
}
```

### Logging in

```
/account/login
```
Parameter|Description
---|---
email|Email
password|Password

**Positive Response:**

```json
{
  "user": {
    "nickname": "WildCat",
    "email": "foo@bar.com",
    "created_at": "2015-07-16T23:43:06.924+08:00"
  },
  "token": "Wo0fv9eTRfnb_zJjLnEw8Q"
}
```

# License

This is a private project. All rights reserved.
