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
                        帐号&nbsp;&nbsp;<input style="width: 100px;border: none;outline: none;text-align: center;color: #333333;font-size: 14px;padding: 0px 5px;border: 1px solid #dcdcdc;border-radius: 5px;background: white;height: 38px;"
                               type="text" name="code" value="${searchRequest.code}"/>
                        姓名&nbsp;&nbsp;<input style="width: 100px;border: none;outline: none;text-align: center;color: #333333;font-size: 14px;padding: 0px 5px;border: 1px solid #dcdcdc;border-radius: 5px;background: white;height: 38px;"
                                             type="text" name="name" value="${searchRequest.name}"/>
                        身份证号&nbsp;&nbsp;<input style="width: 100px;border: none;outline: none;text-align: center;color: #333333;font-size: 14px;padding: 0px 5px;border: 1px solid #dcdcdc;border-radius: 5px;background: white;height: 38px;"
                                             type="text" name="identityCard" value="${searchRequest.identityCard}"/>
                        手机号&nbsp;&nbsp;<input style="width: 100px;border: none;outline: none;text-align: center;color: #333333;font-size: 14px;padding: 0px 5px;border: 1px solid #dcdcdc;border-radius: 5px;background: white;height: 38px;"
                                             type="text" name="cellphone" value="${searchRequest.cellphone}"/>
                    </label>
                    <span style="cursor:pointer;display: inline-block;font-size: 14px; text-align: center;margin-right: 10px;background: #e69c29; padding: 5px 8px;color: white;border-radius: 5px;" onclick="$('#form').submit()">查询</span>
                    <span id="add" onclick="addUser()" style="cursor:pointer;display: inline-block;font-size: 14px; text-align: center;margin-right: 10px;background: #e69c29; padding: 5px 8px;color: white;border-radius: 5px;">新增</span>
                    <span style="cursor:pointer;display: inline-block;font-size: 14px; text-align: center;margin-right: 10px;background: #e69c29; padding: 5px 8px;color: white;border-radius: 5px;" onclick="deleteUser()">删除</span>
                </form>
            </div>

        </div>
    </div>
    <div style="background: #eff1f3; height: 100%; width: 100%;position: absolute; box-sizing: border-box;">
        <table style="border: 1px solid #dcdcdc;width: 100%;border-collapse: collapse;">
            <thead>
                <tr>
                    <th style="background: #dcf1e0;height: 42px;font-size: 14px;border: 1px solid #dcdcdc;
                        text-align: center;color: #333333;padding: 0px 5px;"><input type="checkbox" name="selectAll" id="selectAll" onclick="selectAll()" /></th>
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
                    <th style="background: #dcf1e0;height: 42px;font-size: 14px;border: 1px solid #dcdcdc;
                        text-align: center;color: #333333;padding: 0px 5px;">操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${page.records}" var="item">
                    <tr>
                        <td style="text-align:center;border:1px solid #dcdcdc">
                            <input type="checkbox"  value="${item.id }" id="userId" name="userId"  />
                        </td>
                        <td style="text-align:center;border:1px solid #dcdcdc">${item.code}</td>
                        <td style="text-align:center;border:1px solid #dcdcdc">${item.name}</td>
                        <td style="text-align:center;border:1px solid #dcdcdc">${item.identityCard}</td>
                        <td style="text-align:center;border:1px solid #dcdcdc">${item.cellphone}</td>
                        <td style="text-align:center;border:1px solid #dcdcdc">
                            <c:if test="${item.sex==0}">
                               男
                            </c:if>
                            <c:if test="${item.sex==1}">
                                女
                            </c:if>
                        </td>
                        <td style="text-align:center;border:1px solid #dcdcdc"></td>
                        <td style="text-align:center;border:1px solid #dcdcdc;cursor: pointer" onclick="update(this,'${item.id}')">修改</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!--新增玩家-->
    <div id="tip" lay="1" style="display: none;width:100%;height: 100%; position: fixed;background: rgba(0,0,0,.6);top: 0; z-index: 99;">
        <div class="tipBox addBox" style="width: 402px; height: 500px; margin-left: -201px;margin-top: -200px;position: absolute;left: 50%;top: 50%; box-sizing: border-box;
            padding: 10px; background: #f1f1f3; border-radius: 5px;">
            <p class="pTit tcenter f18 color33 mT10" style="margin-top:10px;text-align: center; color: #333333 !important;font-size: 18px;">新增人员</p>
            <form action="/user/add" method="post" id="addUser">
                <div class="tipCon" style="box-sizing: border-box;padding: 10px 30px;">
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">帐&nbsp;&nbsp;&nbsp;&nbsp;号：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="code" /></p>
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">名&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="name" /></p>
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">手机号码：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="cellphone" /></p>
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">身份证号：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="identityCard" /></p>
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">密&nbsp;&nbsp;码：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="password" /></p>

                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">性&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
                        <label >
                            <select style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" name="sex">
                                <option value="0" >男</option>
                                <option value="1" >女</option>
                            </select>
                        </label>
                    </p>
                </div>
                <div class="BtnDiv mT20" style="text-align: center;margin-top: 20px;">
                    <span style="display: inline-block; width: 124px; height: 38px;line-height: 38px;
    color: white; font-size: 15px; border-radius: 5px;background: #4f3810;margin: 0px 15px;" class="quxiao mLR15" id="cancel" type="button">取消</span>
                    <span style="display: inline-block; width: 124px; height: 38px;line-height: 38px;
    color: white; font-size: 15px; border-radius: 5px;background: #e69c29;margin: 0px 15px;" type="submit" id="save" onclick="submit()">保存</span>
                </div>
            </form>
        </div>
    </div>

    <!--修改-->
    <div id="edit" lay="1" style="display: none;width:100%;height: 100%; position: fixed;background: rgba(0,0,0,.6);top: 0; z-index: 99;">
        <div class="tipBox addBox" style="width: 402px; height: 500px; margin-left: -201px;margin-top: -200px;position: absolute;left: 50%;top: 50%; box-sizing: border-box;
            padding: 10px; background: #f1f1f3; border-radius: 5px;">
            <p class="pTit tcenter f18 color33 mT10" style="margin-top:10px;text-align: center; color: #333333 !important;font-size: 18px;">修改人员</p>
            <form action="/user/update" method="post" id="updateUser">
                <div class="tipCon" style="box-sizing: border-box;padding: 10px 30px;">
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">帐&nbsp;&nbsp;&nbsp;&nbsp;号：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="id" id="id"/></p>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="code" id="code"/></p>
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">名&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="name" id="name"/></p>
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">手机号码：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="cellphone" id="cellphone"/></p>
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">身份证号：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="identityCard" id="identityCard"/></p>
                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">密&nbsp;&nbsp;码：</span>
                        <input style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" type="text" name="password" id="password"/></p>

                    <p style="line-height: 24px;font-size: 14px; margin-bottom: 10px;"><span style="margin-right: 5px;">性&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
                        <label >
                            <select style="height: 36px;width: 210px; border: 1px solid #dcdcdc; border-radius: 5px;background: white;" name="sex" id="sex">
                                <option value="0" >男</option>
                                <option value="1" >女</option>
                            </select>
                        </label>
                    </p>
                </div>
                <div class="BtnDiv mT20" style="text-align: center;margin-top: 20px;">
                    <span style="display: inline-block; width: 124px; height: 38px;line-height: 38px;
    color: white; font-size: 15px; border-radius: 5px;background: #4f3810;margin: 0px 15px;" class="quxiao mLR15" id="editCancel" type="button">取消</span>
                    <span style="display: inline-block; width: 124px; height: 38px;line-height: 38px;
    color: white; font-size: 15px; border-radius: 5px;background: #e69c29;margin: 0px 15px;" type="submit" id="editSave" onclick="editSubmit()">保存</span>
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

    //全选
    function selectAll() {
        var selectAll=document.getElementById('selectAll');
        var checkboxs=document.getElementsByName('userId');
        for(var i=0;i<checkboxs.length;i++){
            checkboxs[i].checked=selectAll.checked;
        }
    }

    function  getCheckBoxValue() {
        var checkboxs=document.getElementsByName('userId');
        var results = "";
        for(var i=0;i<checkboxs.length;i++){
            if( checkboxs[i].checked){
                results+=$(checkboxs[i]).val()+",";
            }
        }
        return results;
    }

    function addUser(){
        $("#tip").css("display","block")
    }

    $("#cancel").click(function(){
        $("#tip").css("display","none")
    })

    $("#editCancel").click(function(){
        $("#edit").css("display","none")
    })

    /*修改*/
    function editSubmit() {
        $('#updateUser').submit();
    }

    /*添加*/
    function submit() {
        $('#addUser').submit();
    }


    function update(obj,id) {
        var thisObj = $(obj);
        var tds = thisObj.prevAll();
        $('#id').val(id);
        $('#code').val(tds[5].innerHTML);
        $('#name').val(tds[4].innerHTML);
        $('#cellphone').val(tds[2].innerHTML);
        $('#identityCard').val(tds[3].innerHTML);
        $("#edit").css("display","block")
    }

    function deleteUser(){
        var userId = getCheckBoxValue();
        if(userId != "" && userId != null && userId != undefined){
            if(confirm('确认删除选中?')){
                window.location.href = "/user/delete/"+userId;
            }

        }
    }

</script>
</html>