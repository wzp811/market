<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link rel=”icon” href=”/dir/favicon.ico” mce_href=”/dir/favicon.ico” type=”image/x-icon”>
    <link rel=”shortcut icon” href=”/dir/favicon.ico” mce_href=”/dir/favicon.ico” type=”image/x-icon”>
    <link rel="icon" href="animated_favicon1.gif" type="image/gif" >
    <link type="text/css" rel="stylesheet" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/public.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市订单管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${loginInfo.role.name} ${loginInfo.realName }</span> , 欢迎你！</p>
        <a href="jsp/logout.do">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>

<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="/order/query">订单管理</a></li>
                <li><a href="/provider/query">供应商管理</a></li>
                <li><a href="/user/query">用户管理</a></li>
                <li><a href="jsp/pwdmodify.jsp">密码修改</a></li>
                <li><a href="jsp/logout.do">退出系统</a></li>
            </ul>
        </nav>
    </div>

    <div class="right">
        <!-- 主体内容发生变化的地方开始-->
        <div>
            <img class="wColck" src="/images/clock.jpg" alt=""/>
            <div class="wFont">
                <h2>${loginInfo.role.name}</h2>
                <p>欢迎来到超市订单管理系统!</p>
            </div>
        </div>
        <!-- 主体内容发生变化的地方结束-->
    </div>
</section>


<footer class="footer">
    版权归北大青鸟
</footer>
<script type="text/javascript" src="/js/time.js"></script>
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/calendar/WdatePicker.js"></script>
</body>
</html>
