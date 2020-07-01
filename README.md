# 项目创建命令

```
# 创建项目
# --database=postgresql  设置数据库
# --skip-action-mailbox 跳过收件箱
# --skip-action-text 跳过富文本
# --skip-sprockets 
# --skip-javascript 前后分离的用不到
# --skip-turbolinks 
# --skip-system-test 跳过系统测试
# --skip-test 跳过测试
# --api 很轻量的模式
# --skip-webpack-install 跳过 webpack 安装

rails new rails-demo-1 --database=postgresql --skip-action-mailbox --skip-action-text --skip-sprockets --skip-javascript --skip-turbolinks --skip-system-test
--skip-test --api
--skip-webpack-install

# 打开这个项目
# 在 .gitignore里 添加 .idea / .vscode 忽略提交
```


### 如何运行项目

> docker 创建数据库容器，解决各种繁琐安装软件问题

```
# 项目根目录运行
docker run -v `pwd`/demo_pg_data:/var/lib/postgresql/data -p 5001:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=123456 -d postgres:12.2
```

> 修改数据库配置 config/database.yml

```
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: admin
  password: 123456
  host: localhost
  port: 5001

development:
  <<: *default
  database: morney_rails_1_development

test:
  <<: *default
  database: morney_rails_1_test

production:
  <<: *default
  database: morney_rails_1_production
  username: morney_rails_1
  password: <%= ENV['MORNEY_RAILS_1_DATABASE_PASSWORD'] %>
```

> 创建数据库

```
bin/rails db:create
```

> 运行


`bin/rails s`

### 创建model

```
# 创建 users 表 并添加两个字段
# 此时并没有真正创建表，而是创建了 表的迁移语句
bin/rails g model User email:string password_digest:string

# 你需要继续运行迁移命令
bin/rails  db:migrate
```

### 命令行方式操作 user模型

> 增

```
# 输入命令进入命令行模式
bin/rails console

# 这里输入 u = User.new
irb(main):001:0> u = User.new
# 告诉你创建了一个 user对象
=> #<User id: nil, email: nil, password_digest: nil, created_at: nil, updated_at: nil>

# 设置 email
irb(main):002:0> u.email = '1@qq.com'
=> "1@qq.com"
# 设置 密码
irb(main):003:0> u.password_digest='xxx'
=> "xxx"

# 保存
irb(main):004:0> u.save
   (1.3ms)  BEGIN
  User Create (9.1ms)  INSERT INTO "users" ("email", "password_digest", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["email", "1@qq.com"], ["password_digest", "xxx"], ["created_at", "2020-07-01 13:33:19.675420"], ["updated_at", "2020-07-01 13:33:19.675420"]]
   (4.2ms)  COMMIT
=> true


# 此时去看 数据库 一条数据就录入了
```

> 查询

- User.all
- User.all[0] 第一条数据
- User.first 找出第一个

```
irb(main):005:0> User.all
  User Load (5.0ms)  SELECT "users".* FROM "users" LIMIT $1  [["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<User id: 1, email: "1@qq.com", password_digest: [FILTERED], created_at: "2020-07-01 13:33:19", updated_at: "2020-07-01 13:33:19">]>
irb(main):006:0> User.all[0]
  User Load (2.2ms)  SELECT "users".* FROM "users"
=> #<User id: 1, email: "1@qq.com", password_digest: [FILTERED], created_at: "2020-07-01 13:33:19", updated_at: "2020-07-01 13:33:19">
irb(main):007:0> 
```


### 使用方法

```
git clone git@github.com:slTrust/express-starter-1.git <你的目录名>
cd <你的目录名>
```
### 上传到其他仓库

```
git remote set-url origin 新仓库的地址
git push -u origin master
```
