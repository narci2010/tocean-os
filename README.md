**项目说明** 
- 拓胜项目模板是一个轻量级的Java快速开发平台，基于各大开源项目组合而来，用于快速构建中小型API、RESTful API项目，该项目已经有过多个大中型项目的实践，稳定、简单、快速，使我们摆脱那些重复劳动。

<br> 
 


**具有如下特点** 
- 友好的代码结构及注释，便于阅读及二次开发
- 实现前后端分离，通过token进行数据交互，前端再也不用关注后端技术
- 灵活的权限控制，可控制到页面或按钮，满足绝大部分的权限需求
- 页面交互使用Vue2.x，极大的提高了开发效率
- 统一异常处理
- 使用Druid Spring Boot Starter 集成Druid数据库连接池与监控
- 完善的代码生成机制，可在线生成entity、xml、dao、service、html、js、sql代码，减少70%以上的开发任务
- 引入quartz定时任务，可动态完成任务的添加、修改、删除、暂停、恢复及日志查看等功能
- 引入API模板，根据token作为登录令牌，极大的方便了APP接口开发
- 引入快速API代码生成,减少90%以上的开发任务，复杂逻辑只须要修改mapper.xml，一个模块只须几分钟
- 引入接口数据加密传输
- 引入Hibernate Validator校验框架，轻松实现后端校验
- 引入云存储服务，已支持：七牛云、阿里云、腾讯云等
- 引入swagger文档支持，方便编写API接口文档
- 引入路由机制，刷新页面会停留在当前页
<br> 

**项目结构** 
```
├─doc  项目SQL语句
│
├─common 公共模块
│  ├─aspect 系统日志
│  ├─exception 异常处理
│  ├─validator 后台校验
│  └─xss XSS过滤
│ 
├─config 配置信息
│ 
├─modules 功能模块
│  ├─app API接口模块(APP调用)：这个包废弃掉，因为app与后台api的安全控制没必要分开两套机制
│  ├─job 定时任务模块
│  ├─oss 文件服务模块
│  └─sys 权限模块
│ 
├─bootstrap 项目启动类 com.toceansoft
│  
├──resources 
│  ├─mapper SQL对应的XML文件
│  ├─static 第三方库、插件等静态资源
│  └─views  项目静态页面

```
<br> 

**技术选型：** 
- 核心框架：Spring Boot 1.5
- 安全框架：Apache Shiro 1.3
- 视图框架：Spring MVC 4.3
- 持久层框架：MyBatis 3.3
- 定时器：Quartz 2.3
- 数据库连接池：Druid 1.0
- 日志管理：SLF4J 1.7、Log4j
- 页面交互：Vue2.x 


#日志
## 需要写日志的方法加入标注@SysLog
/app/login
{
  "encryptData": {"mobile":"13612345678","password":"admin"}
}
返回
{
    "code": 200,
    "data": "{\"password\":\"8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918\",\"create_time\":\"Mar 23, 2017 10:37:41 PM\",\"user_id\":1,\"expire\":604800,\"mobile\":\"13612345678\",\"username\":\"mark\",\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNTQ0ODYyMTA5LCJleHAiOjE1NDU0NjY5MDl9.om8IP-S5vdLlmnyFGqfZyhpgBUPRsW9LusiN68ES3RiCssHg5Hi4vEBByK6DNbRm25NXzWbK-AAvCS95MTSNPg\"}",
    "message": "请求成功",
    "mobile": "",
    "version": "1.0"
}

admin/admin
cas rest client
http://localhost/login/rest?client_name=rest&username=casuser&password=Mellon
/user/detail?client_name=jwt&token=eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiZGlyIn0..EqEcbkiIZOy0RChl.umiHLEBypq70ISZqFc5JWdh-IQH86WNbrspTf772gj4OeooDq47vA7gm4X-CHYO3BsBqPCcZ3LyBBbaJosnOUBbZ2RZXWgMJ5dpO6_UKr1UwfJ_zhN1oLaVNU5z7ZzkPKUosp6LLQBeLcL-ig8uivzDgndnNh93g2BsarlItPvWPyWkBi294nFiKOPBgIhaLTqUZucdyfScskEF2cGk54gwSfM2yAfD7nISP4huQ02GWaQiVdH-RHhC-TbmcStxLE-KG5J7zpnOZVFgfn2RTe0RDcS4MFrvvIW3t-JWOteXuVKXyXKEbgP84dCNLx-OM7P-tY4MLsd08vPnheRkLFAf0yXAIb46963p4ZFCqjqsRxurKzcSTNtJdp3aIvVawFOGkC8DamaurtbZ8ijAK_2HPNQ8Ysm6JgV8-x2oqeivvqe0GIWbs18yquwlT5xyDIq_FAEdDpj4WNFr1b6S-gWv1SlB1ttepH83AP8I.LKR10V-VGFxcwjuHT2NPzg

