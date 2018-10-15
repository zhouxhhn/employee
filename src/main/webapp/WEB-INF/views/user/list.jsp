<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/resources/main/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/resources/main/css/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/resources/datetime/skin/jedate.css" />
</head>
<body>
    <div class="tableW PhoneBetting divbox pad20 TongjiTab">
        <div class="phoneTop">
            <div inDiv>
                <form action="/user/list" id="form">
                    <label class="mR10">
                        <input type="text" name="userName" value="${command.userName}"/>&nbsp;&nbsp;姓名
                    </label>
                </form>
            </div>
            <div class="chaxun mLR5" onclick="$('#form').submit()">查询</div>
            <div class="batchEdit Btn1 yanQing" la="1" inDiv>新增</div>
            <div class="batchEdit Btn1 yanQing" la="1" inDiv>修改</div>
            <div class="batchEdit Btn1 yanQing" la="1" inDiv>删除</div>
        </div>
    </div>
    <div class="divW w100">
        <table class="layerTab">
            <thead>
                <tr>
                    <th>帐号</th>
                </tr>
                <tr>
                    <th>姓名</th>
                </tr>
                <tr>
                    <th>身份证号</th>
                </tr>
                <tr>
                    <th>手机号码</th>
                </tr>
                <tr>
                    <th>性别</th>
                </tr>
                <tr>
                    <th>头像</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${page.records}" var="item">
                    <tr>
                        <td>${item.code}</td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>
    </div>
</body>
<script src="/resources/main/js/jquery2-1-4.min.js"></script>
</html>