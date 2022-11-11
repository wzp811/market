<%@page language="java" contentType="text/html; charset=utf-8"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<p>
				<span>下午好！</span><span style="color: #fff21b"> 系统管理员</span> , 欢迎你！
			</p>
			<a href="/jsp/logout.do">退出</a>
		</div>
	</header>
	<!--时间-->
	<section class="publicTime">
		<span id="time">2015年1月1日 11:11 星期一</span> <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
	</section>
	<!--主体内容-->
	<section class="publicMian ">
		<div class="left">
			<h2 class="leftH2">
				<span class="span1"></span>功能列表 <span></span>
			</h2>
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
				<strong>你现在所在的位置是:</strong> <span>用户管理页面</span>
			</div>
			<div class="search">
				<form method="get" action="/jsp/user.do">
					<input name="method" value="query" class="input-text" type="hidden">
					<span>用户名：</span> <input name="queryname" class="input-text"
						type="text" value=""> <span>用户角色：</span> <select
						name="queryUserRole">

						<option value="0">--请选择--</option>

						<option value="1">系统管理员</option>

						<option value="2">经理</option>

						<option value="3">普通员工</option>


					</select> <input type="hidden" name="pageIndex" value="1" /> <input
						value="查 询" type="submit" id="searchbutton"> <a
						href="/jsp/useradd.jsp">添加用户</a>
				</form>
			</div>
			<!--用户-->
			<table class="providerTable" cellpadding="0" cellspacing="0">
				<tr class="firstTr">
					<th width="10%">账号</th>
					<th width="20%">姓名</th>
					<th width="10%">性别</th>
					<th width="10%">年龄</th>
					<th width="10%">电话</th>
					<th width="10%">职务</th>
					<th width="30%">操作</th>
				</tr>
				
				<c:forEach items="${userList }" var="u">
					<tr>
						<td><span>${u.userName }</span></td>
						<td><span>${u.realName }</span></td>
						<td><span>${u.genderName } </span></td>
						<td><span>${u.age }</span></td>
						<td><span>${u.phone }</span></td>
						<td><span>${u.role.name }</span></td>
						<td>
							<span><a class="viewUser" href="/user/unique?id=${u.id }&page=detail"><img src="/images/read.png" alt="查看" title="查看"/></a></span>
							<span><a class="modifyUser" href="/user/unique?id=${u.id }&page=update"><img src="/images/xiugai.png" alt="修改" title="修改"/></a></span>
							<span><a class="deleteUser" href="javascript:;"><img src="/images/schu.png" alt="删除" title="删除" /></a></span>
						</td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" id="totalPageCount" value="3" />

			<div class="page-bar">
				<ul class="page-num-ul clearfix">
					<li>共12条记录&nbsp;&nbsp; 1/3页</li>


					<a href="#">下一页</a>
					<a href="#">最后一页</a> &nbsp;&nbsp;
				</ul>
				<span class="page-go-form"><label>跳转至</label> <input
					type="text" name="inputPage" id="inputPage" class="page-key" />页
					<button type="button" class="page-btn"
						onClick='jump_to(document.forms[0],document.getElementById("inputPage").value)'>GO</button>
				</span>
			</div>

		</div>


		<!--点击删除按钮后弹出的页面开始-->
		<div class="zhezhao"></div>
		<div class="remove" id="removeUse">
			<div class="removerChid">
				<h2>提示</h2>
				<div class="removeMain">
					<p>你确定要删除该用户吗？</p>
					<a href="#" id="yes">确定</a> <a href="#" id="no">取消</a>
				</div>
			</div>
		</div>
		<!--点击删除按钮后弹出的页面结束-->

	</section>

	<footer class="footer"> 版权归北大青鸟</footer>
	<script type="text/javascript" src="/js/time.js"></script>
	<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/calendar/WdatePicker.js"></script>
	<script type="text/javascript" src="/js/userlist.js"></script>
</body>
</html>

