#  风电智慧系统 API 接口文档

# 1. API V1 接口说明

- 接口基准地址：`http://127.0.0.1:5000/api/v1.0`
- 服务端已开启 CORS 跨域支持
- API V1 认证统一使用 Token 认证
- 需要授权的 API ，必须在请求头中使用 `Authorization` 字段提供 `token` 令牌
- 使用 HTTP Status Code 标识状态
- 数据返回格式统一使用 JSON

## 1.1 支持的请求方法

- GET（SELECT）：从服务器取出资源（一项或多项）。
- POST（CREATE）：在服务器新建一个资源。
- PUT（UPDATE）：在服务器更新资源（客户端提供改变后的完整资源）。
- PATCH（UPDATE）：在服务器更新资源（客户端提供改变的属性）。
- DELETE（DELETE）：从服务器删除资源。
- HEAD：获取资源的元数据。
- OPTIONS：获取信息，关于资源的哪些属性是客户端可以改变的。

## 1.2 通用返回状态说明

| *状态码* | *含义*                | *说明*                                              |
| -------- | --------------------- | --------------------------------------------------- |
| 200      | OK                    | 请求成功                                            |
| 201      | CREATED               | 创建成功                                            |
| 204      | DELETED               | 删除成功                                            |
| 400      | BAD REQUEST           | 请求的地址不存在或者包含不支持的参数                |
| 401      | UNAUTHORIZED          | 未授权                                              |
| 403      | FORBIDDEN             | 被禁止访问                                          |
| 404      | NOT FOUND             | 请求的资源不存在                                    |
| 422      | Unprocesable entity   | [POST/PUT/PATCH] 当创建一个对象时，发生一个验证错误 |
| 500      | INTERNAL SERVER ERROR | 内部错误                                            |
|          |                       |                                                     |

------
# 2. 登录
## 2.1 登录
+ 描述：前端调用该接口可以实现登录功能
+ 请求路径: /session
+ 请求方式：POST
+ 请求参数：\
格式：json

| *参数名* | *类型* | *是否必须* | *说明*         |
|----------|--------|------------|----------------|
| count    | 字符串 | 是         | 用户登录的帐号 |
| password | 字符串 | 是         | 用户密码       |

+ 响应数据：\
格式：json

| 参数名 | 类型   | 是否必须 | 说明     | 
|--------|--------|----------|----------|
| errno  | 字符串 | 是       | 错误代码 |
| errmsg | 字符串 | 是       | 错误信息 |

+ 响应示例：
```
{
    "errmsg": "用户名或密码错误",
    "errno": "4004"
}
```
```
{
    "errmsg": "登陆成功",
    "errno": "0"
}
```

# 3. 系统管理
## 3.1 用户管理
### 3.1.1 获得用户列表
+ 描述：前端访问该接口，可以得到所有用户的信息
+ 请求路径：/user/show?page=page
+ 请求方法：GET
+ 请求参数：\

| 参数名 | 类型     | 是否必须 | 说明         |
|--------|----------|----------|--------------|
| page  | 字符串   | 否 | 页码     |

+ 响应数据：\
格式：json
 
| 参数名 | 类型     | 是否必须 | 说明         |
|--------|----------|----------|--------------|
| errno  | 字符串   | 是 | 错误代码     |
| errmsg | 字符串   | 是 | 错误信息     |
| data   | 字典列表 | 否 | 用户信息数据 |
| current_page   | 整型     | 否       | 当前页     |
| total_page_num | 整型     | 否       | 总页数     |
| users           | 字典列表 | 否       | 用户的列表 |

+ 响应示例：
```
{
    "data": {
        "current_page": 1,
        "total_page_num": 1,
        "users": [
            {
                "count": "admin",
                "email": null,
                "name": "admin",
                "phone": "13144448888",
                "role": "普通用户",
                "state": "启用",
                "user_id": 1
            },
            {
                "count": "test1",
                "email": null,
                "name": "test1",
                "phone": "13144448888",
                "role": "管理员",
                "state": "启用",
                "user_id": 2
            },
            {
                "count": "test3",
                "email": null,
                "name": "test3",
                "phone": "13144448888",
                "role": "普通用户",
                "state": "启用",
                "user_id": 4
            },
            {
                "count": "test4",
                "email": null,
                "name": "test4",
                "phone": "13144448888",
                "role": "管理员",
                "state": "启用",
                "user_id": 5
            }
        ]
    },
    "errmsg": "OK",
    "errno": "0"
}
```

### 3.1.2 添加用户
+ 描述：前端访问该端口，可以向数据库添加用户。
+ 请求路径：/user/add
+ 请求方式：POST
+ 请求参数：\
格式：json

| 参数名   | 类型   | 是否必须 | 说明                                                               |
|----------|--------|----------|--------------------------------------------------------------------|
| count    | 字符串 | 是       | 用户帐号                                                           |
| password | 字符串 | 是       | 用户密码                                                           |
| name     | 字符串 | 是       | 用户昵称                                                           |
| role     | 字符串 | 是       | 用户角色，有管理员和普通用户两种角色，必须为"管理员"或者"普通用户"之一 |
| phone    | 字符串 | 否       | 用户电话号码                                                       |
| email    | 字符串 | 否       | 用户邮箱                                                           |


+ 响应数据：\
格式：json

| 参数名 | 类型   | 是否必须 | 说明     |
|--------|--------|----------|----------|
| errno  | 字符串 | 否       | 错误代码 |
| errmsg | 字符串 | 否       | 错误信息 |

+ 响应示例：
```
{
    "errmsg": "成功添加",
    "errno": "0"
}
```
```
{
    "errmsg": "数据库异常",
    "errno": "4001"
}
```
### 3.1.3 删除用户
+ 描述：前端访问该端口，从数据库删除用户
+ 请求路径：/user/delete/<int:user_id>
+ 请求方式：PUT
+ 请求参数：\

| 参数名  | 类型   | 是否必须 | 说明             |
|---------|--------|----------|------------------|
| user_id | 字符串 | 是       | 要删除的用户的id |

+ 响应数据：\
格式：json

| 参数名 | 类型   | 是否必须 | 说明     |
|--------|--------|----------|----------|
| errno  | 字符串 | 否       | 错误代码 |
| errmsg | 字符串 | 否       | 错误信息 |

+ 响应示例：
```
{
    "errmsg": "删除用户成功",
    "errno": "0"
}
```

### 3.1.4 改变用户状态
+ 描述：如果用户状态是启用，通过该API可以将用户禁用;如果用户在禁用状态，访问该API可将用户启用。
+ 请求路径：/user/state/<int:user_id>
+ 请求方式：PUT
+ 请求参数：\

| 参数名  | 类型   | 是否必须 | 说明                 |
|---------|--------|----------|----------------------|
| user_id | 字符串 | 是       | 要改变状态的用户的id |

+ 响应数据：\
格式：json

| 参数名 | 类型   | 是否必须 | 说明     |
|--------|--------|----------|----------|
| errno  | 字符串 | 否       | 错误代码 |
| errmsg | 字符串 | 否       | 错误信息 |

+ 响应示例：
```
{
    "errmsg": "修改用户状态成功",
    "errno": "0"
}
```

### 3.1.5 查询用户
+ 描述：前端传入查询参数访问该接口，获得符合查询条件的用户列表。
+ 请求路径：/user/search?uc=count,up=phone,us=state,p=page
+ 请求方式：GET
+ 请求数据：\
格式：查询参数


| 参数名 | 类型   | 是否必须 | 说明         |
|--------|--------|----------|--------------|
| uc     | 字符串 | 否       | 用户帐号     |
| up     | 字符串 | 否       | 用户电话号码 |
| us     | 字符串 | 否       | 用户状态     |
| p      | 字符串 | 否       | 查询的页数   |

+ 响应参数：\
格式：json

| 参数名         | 类型     | 是否必须 | 说明       |
|----------------|----------|----------|------------|
| errno          | 字符串   | 是       | 错误代码   |
| errmsg         | 字符串   | 是       | 错误信息   |
| current_page   | 整型     | 否       | 当前页     |
| total_page_num | 整型     | 否       | 总页数     |
| users           | 字典列表 | 否       | 用户的列表 |

+ 响应示例
```
{
    "data": {
        "current_page": 1,
        "total_page_num": 1,
        "users": [
            {
                "count": "admin",
                "email": null,
                "name": "admin",
                "phone": "13144448888",
                "role": "管理员",
                "state": "启用",
                "user_id": 1
            },
            {
                "count": "test1",
                "email": null,
                "name": "test1",
                "phone": "13144448888",
                "role": "普通用户",
                "state": "启用",
                "user_id": 2
            },
            {
                "count": "test3",
                "email": null,
                "name": "test3",
                "phone": "13144448888",
                "role": "管理员",
                "state": "启用",
                "user_id": 4
            },
            {
                "count": "test4",
                "email": null,
                "name": "test4",
                "phone": "13144448888",
                "role": "普通用户",
                "state": "启用",
                "user_id": 5
            }
        ]
    },
    "errmsg": "OK",
    "errno": "0"
}
```

## 3.2 日志管理
### 3.2.1 获取日志信息
+ 描述：前端访问该端口，可以获得日志信息
+ 请求方式：GET
+ 请求路径：/log/show?page=page
+ 请求参数：\

| 参数名         | 类型     | 是否必须 | 说明       |
|----------------|----------|----------|------------|
| page           | 字符串 | 否       | 要查看的日志的页数 |

+ 响应数据：


| 参数名         | 类型     | 是否必须 | 说明       |
|----------------|----------|----------|------------|
| errno          | 字符串   | 是       | 错误代码   |
| errmsg         | 字符串   | 是       | 错误信息   |
| current_page   | 整型     | 否       | 当前页     |
| total_page_num | 整型     | 否       | 总页数     |
| logs           | 字典列表 | 否       | 日志的列表 |

+ 响应示例：

```
{
    "data": {
        "current_page": 1,
        "logs": [
            {
                "count": "test1",
                "log_id": 4,
                "login_ip": "127.0.0.1",
                "method_info": "UserLogin: Count=    ,",
                "method_time": "Fri, 04 Feb 2022 12:23:42 GMT",
                "methods_type": "用户登录",
                "name": "test1"
            },
            {
                "count": "test1",
                "log_id": 3,
                "login_ip": "127.0.0.1",
                "method_info": null,
                "method_time": "Thu, 03 Feb 2022 01:34:33 GMT",
                "methods_type": "修改用户信息",
                "name": "test1"
            },
            {
                "count": "test1",
                "log_id": 2,
                "login_ip": "127.0.0.1",
                "method_info": null,
                "method_time": "Thu, 03 Feb 2022 01:34:18 GMT",
                "methods_type": "用户登录",
                "name": "test1"
            },
            {
                "count": "admin",
                "log_id": 1,
                "login_ip": "127.0.0.1",
                "method_info": null,
                "method_time": "Thu, 03 Feb 2022 01:32:26 GMT",
                "methods_type": "用户登录",
                "name": "admin"
            }
        ],
        "total_page_num": 1
    },
    "errmsg": "OK",
    "errno": "0"
}
```

### 3.2.2 查询日志
+ 描述：前端访问该接口，可以获得符合查询条件的日志列表。
+ 请求路径：/log/search?sd=2000-01-12&ed=2023-01-13&p=1
+ 请求方式：GET
+ 请求参数：
 
| 参数名 | 类型   | 是否必须 | 说明         |
|--------|--------|----------|--------------|
| sd     | 字符串 | 否       | 要查询日志的开始时间，格式必须是xxxx-xx-xx |
| ed     | 字符串 | 否       | 要查询日志的结束时间，格式必须是xxxx-xx-xx |
| p      | 字符串 | 否       | 查询的页数   |

+ 响应参数：\
格式：json

| 参数名         | 类型     | 是否必须 | 说明       |
|----------------|----------|----------|------------|
| errno          | 字符串   | 是       | 错误代码   |
| errmsg         | 字符串   | 是       | 错误信息   |
| current_page   | 整型     | 否       | 当前页     |
| total_page_num | 整型     | 否       | 总页数     |
| logs           | 字典列表 | 否       | 日志的列表 |

+ 响应示例
```
{
    "data": {
        "current_page": 1,
        "logs": [
            {
                "count": "test1",
                "login_ip": "127.0.0.1",
                "method_info": "UserLogin: Count=    ,",
                "method_time": "Fri, 04 Feb 2022 12:23:42 GMT",
                "methods_type": "用户登录",
                "name": "test1"
            },
            {
                "count": "test1",
                "login_ip": "127.0.0.1",
                "method_info": null,
                "method_time": "Thu, 03 Feb 2022 01:34:33 GMT",
                "methods_type": "修改用户信息",
                "name": "test1"
            },
            {
                "count": "test1",
                "login_ip": "127.0.0.1",
                "method_info": null,
                "method_time": "Thu, 03 Feb 2022 01:34:18 GMT",
                "methods_type": "用户登录",
                "name": "test1"
            },
            {
                "count": "admin",
                "login_ip": "127.0.0.1",
                "method_info": null,
                "method_time": "Thu, 03 Feb 2022 01:32:26 GMT",
                "methods_type": "用户登录",
                "name": "admin"
            }
        ],
        "total_page_num": 1
    },
    "errmsg": "OK",
    "errno": "0"
}
```
