# Alexstrasza

An English learning system built with Rails.
[Alexstrasza](http://wowwiki.wikia.com/Alexstrasza) is a dragon, as the guardian of all life.

# API Document

We mainly support RESTful API, here are details:

> **Notice:** The version number of all the following APIs is 1, so they begin with a prefix `/api/v1`. For example, `/account/reg` means `/api/v1/account/reg`.

## Error response

There are 3 parts of an error response: code, message and details. 
 
```json
{  
  "errors": {
    "code": 101,  
    "message": "昵称已存在",
    "details": {
      "nickname": [ "已经被使用" ]
    }
  }
}
```

## Account

> This part includes: registration, logging in.

### Registration

```
account/reg
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
account/login
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