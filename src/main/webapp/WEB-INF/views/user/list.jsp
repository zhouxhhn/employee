<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
</head>
<body>
    <div >
        <div >
            <div >
                <form action="/user/list" id="form">
                    <label>
                        <input type="text" name="userName"/>&nbsp;&nbsp;姓名
                    </label>
                </form>
            </div>
            <div onclick="$('#form').submit()">查询</div>
            <div ><span>新增</span><span>修改</span><span>删除</span></div>
        </div>
    </div>
    <div>
        <table>
            <thead>
                <tr>
                    <th>帐号</th>
                    <th>姓名</th>
                    <th>身份证号</th>
                    <th>手机号码</th>
                    <th>性别</th>
                    <th>头像</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${page.records}" var="item">
                    <tr>
                        <td>${item.code}</td>
                        <td>${item.name}</td>
                        <td>${item.identityCard}</td>
                        <td>${item.cellphone}</td>
                        <td>${item.sex}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
<script src="/resources/main/js/jquery2-1-4.min.js"></script>
</html>