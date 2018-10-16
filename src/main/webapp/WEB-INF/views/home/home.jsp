<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/iconfont.css" />
    <style>
        .outLogin {
            font-size: 14px;
            color: #666;
            text-align: center;
            line-height: 32px;
            border: 1px solid #999;
            position: absolute;
            right: 40px;
            top: 42px;
            width: 100px;
            z-index: 99;
            background: white;
        }
        .outLogin:hover {
            cursor: pointer;
        }
    </style>
</head>

<body style="background: #1c1c1c;">
<!--左边tab-->
<div style="width: 180px;background: #1c1c1c;height:100%;float: left;overflow: hidden;">
    <div style="text-align:center;height:136px;">
        <img style="margin-top:18px;" src="/resources/img/logo.png" />
    </div>
    <ul style="width:100%">

        <li style="list-style: none">
            <a style="display: block;width: 100%;box-sizing:border-box;padding-left:25px;
             height:44px;line-height:44px;color:white;font-size:14px;text-decoration: none;" href="/user/list" target="contentBox"><i class="iconfont icon-guanli"></i>从业人员管理 </a>
        </li>

        <li style="list-style: none">
            <a style="display: block;width: 100%;box-sizing:border-box;padding-left:25px;
             height:44px;line-height:44px;color:white;font-size:14px;text-decoration: none;" href="/attendance/list" target="contentBox"><i class="iconfont icon-mingxi1"></i>考勤管理 </a>
        </li>
        <!--
        <li class="">
            <p class="iconfont icon-xialajiantou">&nbsp;&nbsp;&nbsp;&nbsp;充值提现管理</p>
            <div>
                <a href="/recharge/pagination" target="contentBox"><i class="iconfont icon-chongzhimingxi"></i>充值明细</a>
                <a href="/rechargeCtl/edit" target="contentBox"><i class="iconfont icon-mingxi"></i>支付管理</a>
                <a href="/withdraw/pagination" target="contentBox"><i class="iconfont icon-tixian"></i>提现管理 </a>
            </div>

        </li>
        -->
    </ul>
</div>
<div style="overflow:hidden">
    <div style="height: 56px; line-height: 56px;width: 100%; background: #1c1c1c;
    color: white;text-align: right; box-sizing: border-box; padding-right: 60px;position: relative;">
        <div style="position: absolute;height: 56px;line-height: 56px;
                color: white;font-size: 14px;padding-left: 20px;">从业人员管理</div>
        <div><a href="/logout" style="color: #DDDDDD;list-style: none;text-decoration: none;">注销</a></div>
    </div>
    <div style="position: absolute;left: 180px;width:-webkit-calc( 100% - 180px)">
        <iframe style="width: 100%; height: 100%;background: #f7f3f3;border: none;outline: none;" frameborder=0 src="/user/list" name="contentBox"></iframe>
    </div>
</div>
</body>
<script src="/resources/js/jquery2-1-4.min.js"></script>
<script type="text/javascript">
    $(".tabList>li,.layerTab tbody tr,.pageWrap a").click(function() {
        $(this).addClass("on").siblings().removeClass("on");
    });
    $(".tabList>li a").click(function() {
        $(".divTit").html($(this).html())
    });
    $(".tabList>li p").click(function() {
        $(this).siblings("div").slideToggle(300);
    });
    $("#user").click(function() {
        $(this).siblings("#logout").slideToggle(300);
    });
</script>

</html>