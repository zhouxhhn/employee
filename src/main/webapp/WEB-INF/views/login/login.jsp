<html>
    <head>
        <title>登录页面</title>
        <meta charset="UTF-8" />
    </head>
    <script type="text/javascript" src="/resources/js/jquery2-1-4.min.js"></script>
    <body>
       <form action="/main" id="form" method="post">
           用户名：<input type="text" id="code" name="code" value="${loginUserVo.code}"/><br/>
           密码：<input type="password" id="password" name="password" value="${loginUserVo.password}"/><br/>
           <span text="${message}"></span>
       </form>
       <div onclick="$('#form').submit()">登录</div>
    </body>
</html>