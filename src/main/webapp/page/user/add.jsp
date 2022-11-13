<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="/css/style.css" />
    <link type="text/css" rel="stylesheet" href="/css/public.css" />
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
            <span>用户管理页面 >> 用户添加页面</span>
        </div>
        <div class="providerAdd">
            <form id="form1" name="userForm" method="post" action="/user/add">
                <div>
                    <label for="userCode">账号：</label>
                    <input type="text" name="userName" id="userCode" value="">
                    <!-- 放置提示信息 -->
                    <font color="red"></font>
                </div>
                <div>
                    <label for="userName">姓名：</label>
                    <input type="text" name="realName" id="userName" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="userPassword">密码：</label>
                    <input type="password" name="password" id="userPassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="ruserPassword">确认密码：</label>
                    <input type="password" id="ruserPassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label >性别：</label>
                    <select name="gender" id="gender">
                        <option value="1">男</option>
                        <option value="2">女</option>
                        <option value="0" selected>保密</option>
                    </select>
                </div>
                <div>
                    <label for="birthday">生日：</label>
                    <input type="text" Class="Wdate" id="birthday" name="birthday" readonly onclick="WdatePicker();">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="phone">电话：</label>
                    <input type="text" name="phone" id="phone" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="address">地址：</label>
                    <input name="address" id="address"  value="">
                </div>
                <div>
                    <label >职务：</label>
                    <select name="roleId" id="userRole">
                    	<option value="">请选择</option>
                   		<c:forEach items="${roleList }" var="r">
                   			<option value="${r.id }">${r.name }</option>
                   		</c:forEach>
                    </select>
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="button" name="add" id="add" value="保存" >
                    <input type="button" id="back" name="back" value="返回" >
                </div>
            </form>
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
	
	$("#add").on("click", function(){
		if(!confirm("确定添加吗?")) return;
		
		//提交表单
		$("#form1")[0].submit();
	})
	
	$("#back").on("click", function(){
		location = "/user/query";
	})
</script>
<c:remove var="msg" scope="session"/>
</html>
