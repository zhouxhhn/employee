<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="/resources/main/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/resources/main/css/iconfont.css" />
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
<div class="leftTab box ov fl">
    <div class="logo">
        <img src="/resources/main/img/logo.png" />
    </div>
    <ul class="tabList">

        <li class="">
            <a href="/user/list" target="contentBox"><i class="iconfont icon-guanli"></i>从业人员管理 </a>
        </li>

        <li class="">
            <a href="/attendance/list" target="contentBox"><i class="iconfont icon-mingxi1"></i>考勤管理 </a>
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
<div class="rightWork box ov ">
    <div class="admin posi_re">
        <div class="divTit ">从业人员管理</div>
        <div><a href="/logout" style="color: #DDDDDD">注销</a></div>
    </div>
    <div class="iframeDiv">
        <iframe frameborder=0 src="/user/list" name="contentBox"></iframe>
    </div>
</div>
</body>
<script src="/resources/main/js/jquery2-1-4.min.js"></script>
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