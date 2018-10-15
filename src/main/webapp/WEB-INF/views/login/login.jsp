<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>登录页面</title>
    <meta charset="UTF-8" />
</head>
<script type="text/javascript" src="/resources/js/jquery2-1-4.min.js"></script>
<body>
   <form action="/login" id="form" method="post">
       用户名：<input th:type="text" th:id="code" th:name="code" th:value="${loginUserVo.code}"/><br/>
       密码：<input th:type="password" th:id="password" th:name="password" th:value="${loginUserVo.password}"/><br/>
       <span th:text="${message}"></span>
   </form>
   <div onclick="$('#form').submit()">登录</div>
</body>
</html>