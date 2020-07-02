### 如何运行项目

> docker 创建数据库容器，解决各种繁琐安装软件问题

```
# 项目根目录运行
docker run -v `pwd`/demo_pg_data:/var/lib/postgresql/data -p 5001:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=123456 -d postgres:12.2
```

> 创建数据库

```
bin/rails db:create
```

> 数据库迁移

```
bin/rails db:migrate
```

> 运行

```
bin/rails s
```

### 上传到其他仓库

```
git remote set-url origin 新仓库的地址
git push -u origin master
```
