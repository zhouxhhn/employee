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
                        姓名&nbsp;&nbsp;<input style="width: 100px;border: none;outline: none;text-align: center;color: #333333;font-size: 14px;padding: 0px 5px;border: 1px solid #dcdcdc;border-radius: 5px;background: white;height: 38px;"
                               type="text" name="userName"/>
                    </label>
                    <span style="cursor:pointer;display: inline-block;font-size: 14px; text-align: center;margin-right: 10px;background: #e69c29; padding: 5px 8px;color: white;border-radius: 5px;" onclick="$('#form').submit()">查询</span>
                    <span id="add" style="cursor:pointer;display: inline-block;font-size: 14px; text-align: center;margin-right: 10px;background: #e69c29; padding: 5px 8px;color: white;border-radius: 5px;">新增</span>
                    <span style="cursor:pointer;display: inline-block;font-size: 14px; text-align: center;margin-right: 10px;background: #e69c29; padding: 5px 8px;color: white;border-radius: 5px;">修改</span>
                    <span style="cursor:pointer;display: inline-block;font-size: 14px; text-align: center;margin-right: 10px;background: #e69c29; padding: 5px 8px;color: white;border-radius: 5px;">删除</span>
                </form>
            </div>

        </div>
    </div>
    <div style="background: #eff1f3; height: 100%; width: 100%;position: absolute; box-sizing: border-box;">
        <table style="border: 1px solid #dcdcdc;width: 100%;border-collapse: collapse;">
            <thead>
                <tr>
                    <th style="background: #dcf1e0;height: 42px;font-size: 14px;border: 1px solid #dcdcdc;
                        text-align: center;color: #333333;padding: 0px 5px;">帐号</th>
                    <th style="background: #dcf1e0;height: 42px;font-size: 14px;border: 1px solid #dcdcdc;
                        text-align: center;color: #333333;padding: 0px 5px;">姓名</th>
                    <th style="background: #dcf1e0;height: 42px;font-size: 14px;border: 1px solid #dcdcdc;
                        text-align: center;color: #333333;padding: 0px 5px;">身份证号</th>
                    <th style="background: #dcf1e0;height: 42px;font-size: 14px;border: 1px solid #dcdcdc;
                        text-align: center;color: #333333;padding: 0px 5px;">手机号码</th>
                    <th style="background: #dcf1e0;height: 42px;font-size: 14px;border: 1px solid #dcdcdc;
                        text-align: center;color: #333333;padding: 0px 5px;">性别</th>
                    <th style="background: #dcf1e0;height: 42px;font-size: 14px;border: 1px solid #dcdcdc;
                        text-align: center;color: #333333;padding: 0px 5px;">头像</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${page.records}" var="item">
                    <tr>
                        <td style="text-align:center;border:1px solid #dcdcdc">${item.code}</td>
                        <td style="text-align:center;border:1px solid #dcdcdc">${item.name}</td>
                        <td style="text-align:center;border:1px solid #dcdcdc">${item.identityCard}</td>
                        <td style="text-align:center;border:1px solid #dcdcdc">${item.cellphone}</td>
                        <td style="text-align:center;border:1px solid #dcdcdc">${item.sex}</td>
                        <td style="text-align:center;border:1px solid #dcdcdc"></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!--新增玩家-->
    <div class="tip" lay="1" style="display: none;">
        <div class="tipBox addBox">
            <p class="pTit tcenter f18 color33 mT10">新增玩家</p>
            <form action="/user/create" method="post" id="addUser">
                <div class="tipCon">
                    <p><span ><i hid>位</i>玩家昵称：</span><input type="text" name="playerAlias" /></p>
                    <p><span ><i hid>位</i>代理别名：</span><input type="text" name="agentAlias" /></p>
                </div>
                <div class="BtnDiv mT20">
                    <span class="quxiao mLR15" type="button">取消</span>
                    <span class="tijiao mLR15" type="submit" onclick="submit()">保存</span>
                </div>
            </form>
        </div>
    </div>
</body>
<script src="/resources/js/jquery2-1-4.min.js"></script>
<script type="text/javascript">
    $(".layerTab tbody tr,.pageWrap a").click(function() {
        $(this).addClass("on").siblings().removeClass("on");
    })

    $("#add").click(function(){
        $(".tip").css("display","none")
    })



    /*添加*/
    function submit() {
        $('#addUser').submit();
    }

    /*批量修改*/
    function listModify() {

        $('#listModify').submit()

    }

    function update() {

        $('#edit').submit();


    }

    function setVirtual() {
        window.location.href = "/user/setVirtual?id="+$('#editUser').val();
    }

    function setPrintScreen() {
        window.location.href = "/user/setPrintScreen?id="+$('#editUser').val();
    }


    function deletePlayer(){
        window.location.href = "/user/delete?id="+$('#editUser').val();

    }

    function setTop() {
        window.location.href = "/user/setTop?id="+$('#editUser').val();
    }

</script>
</html>