<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/public.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市订单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> 系统管理员</span> , 欢迎你！</p>
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
                <li><a href="/jsp/pwdmodify.jsp">密码修改</a></li>
                <li><a href="/jsp/logout.do">退出系统</a></li>
            </ul>
        </nav>
    </div>

    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>订单管理页面 >> 信息查看</span>
        </div>
        <div class="providerView">
            <p><strong>订单编号：</strong><span>${orderInfo.code }</span></p>

            <p><strong>商品名称：</strong><span>${orderInfo.productName }</span></p>

            <p><strong>商品单位：</strong><span>${orderInfo.unit }</span></p>

			<!-- yyyy-MM-dd HH:mm:ss, yyyy-MM-dd HH:mm:ss.SSS -->
            <p><strong>商品数量：</strong><span>${orderInfo.number}</span></p>

            <p><strong>总金额：</strong><span>${orderInfo.amount }</span></p>
            
            <p><strong>供应商：</strong><span>${orderInfo.providerName }</span></p>

            <p><strong>是否付款：</strong><span>${orderInfo.paid }</span></p>

            <div class="providerAddBtn">
                <input type="button" id="back" name="back" value="返回" onclick="backToUserList()">
            </div>
        </div>
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
<script type="text/javascript">
	if("${msg}"){
		alert("${msg}");
	}
	/* 函数: 返回用户列表 */
	function backToUserList(){
		location = "/order/query";
	}
</script>
<c:remove var="msg" scope="session"/>
</html>
