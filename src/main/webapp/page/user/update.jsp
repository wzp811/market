<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <span>订单管理页面 >> 订单修改页面</span>
        </div>
        <div class="providerAdd">
            <form id="form1" name="orderForm" method="post" action="/user/modify?id=${userInfo.id }">
                <div>
                    <label for="userName">订单编码：</label>
                    <input type="text" name="userName" id="userName" value="${userInfo.userName }">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="realName">商品名称：</label>
                    <input type="text" name="realName" id="realName" value="${userInfo.realName }">
                    <font color="red"></font>
                </div>
                <div>
                    <label >性别：</label>
                    <select name="gender" id="gender">
                        <option value="1" <c:if test="${userInfo.gender == 1}">selected</c:if>>男</option>
                        <option value="2" <c:if test="${userInfo.gender == 2}">selected</c:if>>女</option>
                        <option value="0" <c:if test="${userInfo.gender == 0}">selected</c:if>>保密</option>
                    </select>
                </div>
                <div>
                    <label for="birthday">生日：</label>
                    <input type="text" Class="Wdate" id="birthday" name="birthday" 
                    	value="<fmt:formatDate value="${userInfo.birthday }" pattern="yyyy-MM-dd"></fmt:formatDate>"
                        readonly="readonly" onclick="WdatePicker();">
                    <font color="red"></font>
                </div>

                <div>
                    <label for="phone">电话：</label>
                    <input type="text" name="phone" id="phone" value="${userInfo.phone }">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="address">地址：</label>
                    <input type="text" name="address" id="address" value="${userInfo.address }">
                </div>
                <div>
                    <label >职务：</label>
                    <!-- 列出所有的角色分类 -->
                    <select name="roleId" id="roleId">
                    	<c:forEach items="${roleList }" var="r">
                    		<option value="${r.id }" <c:if test="${userInfo.roleId == r.id}">selected</c:if>>${r.name }</option>
                    	</c:forEach>
                    </select>
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="button" name="save" id="save" value="保存" onclick="saveForModify()" />
                    <input type="button" id="back" name="back" value="返回" onclick="backToUserList()"/>
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

	/* 函数: 保存修改 */
	function saveForModify(){
		//提交表单数据
		$("#form1")[0].submit();
	}

	/* 函数: 返回用户列表 */
	function backToUserList(){
		location = "/user/query";
	}
</script>
<c:remove var="msg" scope="session"/>
</html>
