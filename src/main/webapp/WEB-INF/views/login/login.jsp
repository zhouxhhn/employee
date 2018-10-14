<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>登录页面</title>
    <meta charset="UTF-8" />
</head>
<script type="text/javascript" src="../../js/jquery2-1-4.min.js"></script>
<body>
   <form action="/login" id="form">
       <!--您好， <span th:text="${name}"></span>  -->
       用户名：<input th:type="text" th:id="name" th:name="name"/><br/>
       密码：<input th:type="text" th:id="password" th:name="password"/><br/>
   </form>
   <div onclick="$('#form').submit()">登录</div>
</body>
</html>