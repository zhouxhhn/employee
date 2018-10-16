<html>
    <head>
        <link rel="Shortcut Icon" href="/resources/img/logo.png">
        <title>后台管理-登录</title>
        <meta charset="UTF-8" />
    </head>
    <script type="text/javascript" src="/resources/js/jquery2-1-4.min.js"></script>
    <body style="background-color:#f0f2f4;">
       <div style="padding-top: 200px;text-align: center">
           <div style="margin-bottom:20px">
               <strong style="color:#2baab1;font-size:30px">后台管理</strong>
           </div>
           <div >
               <form action="/main" id="form" method="post">
                   <div style="margin-bottom:20px">
                       <input type="text" style="width:370px;height:30px" id="code" name="code" placeholder="用户名" value="${loginUserVo.code}"/>
                   </div>
                   <div style="margin-bottom:20px">
                       <input type="password" style="width:370px;height:30px" id="password" name="password" placeholder="密码" value="${loginUserVo.password}"/>
                   </div>
                   <span text="${message}"></span>
                   <button style="background:#2baab1;border:1px solid #26969c;width:370px;height: 30px" type="submit">登录</button>
               </form>

           </div>

       </div>

    </body>
</html>