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
				<strong>你现在所在的位置是:</strong> <span>供应商管理页面</span>
			</div>
			<div class="search">
				<form method="get" action="/jsp/user.do">
					<input name="method" value="query" class="input-text" type="hidden">
					<span>订单编码：</span> <input name="queryname" class="input-text"
						type="text" value="">


					</select> <input type="hidden" name="pageIndex" value="1" /> <input
						value="查 询" type="submit" id="searchbutton"> <a
						href="/page/provider/add.jsp">添加订单</a>
				</form>
			</div>
			<!--用户-->
			<table class="providerTable" cellpadding="0" cellspacing="0">
				<tr class="firstTr">
					<th width="10%">供应商编码</th>
					<th width="20%">供应商名称</th>
					<th width="10%">联系人</th>
					<th width="10%">联系电话</th>
					<th width="10%">传真</th>
					<th width="10%">描述</th>
					<th width="10%">创建时间</th>
					<th width="20%">操作</th>
				</tr>

				<c:forEach items="${pa.items }" var="u" varStatus="line">
					<tr>
						<td><span>${u.code }</span></td>
						<td><span>${u.name }</span></td>
						<td><span>${u.contact } </span></td>
						<td><span>${u.phone }</span></td>
						<td><span>${u.fax }</span></td>
						<td><span>${u.description }</span></td>
						<td><span>${u.createTime }</span></td>
						<td>
							<span><a class="viewUser" href="/provider/unique?id=${u.id }&page=detail"><img src="/images/read.png" alt="查看" title="查看"/></a></span>
							<span><a class="modifyUser" href="/provider/unique?id=${u.id }&page=update"><img src="/images/xiugai.png" alt="修改" title="修改"/></a></span>
							<span><a class="deleteUser" href="/provider/remove?id=${u.id }" onclick="return confirm('确定删除供应商<${u.name }>吗?')"><img src="/images/schu.png" alt="删除" title="删除" /></a></span>

						</td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" id="totalPageCount" value="3" />

			<div class="page-bar">
				<span>
					第${pa.currPage}页 / 共${pa.totalPage}页
					&nbsp;&nbsp;&nbsp;共${pa.count}条
					<select name="pageSize">
						<c:forEach begin="5" end="20" step="5" var="n">
							<option value="${n}" <c:if test="${pa.pageSize == n}">selected</c:if>>每页${n}条</option>
						</c:forEach>
					</select>
				</span>
				<span>
					<a>首页</a>
					<a>上一页</a>
					<a>下一页</a>
					<a>尾页</a>
					<select name="pageNum">
						<c:forEach begin="1" end="${pa.totalPage }" var="n">
							<option value="${n }" <c:if test="${pa.currPage == n}">selected</c:if>>跳转到第${n }页</option>
						</c:forEach>
					</select>
					第<input name="pageCode" value="${pa.currPage }">页
					<input type="button" value="跳转">
				</span>
			</div>

		</div>


		<!--点击删除按钮后弹出的页面开始-->
		<div class="zhezhao"></div>
		<div class="remove" id="removeUse">
			<div class="removerChid">
				<h2>提示</h2>
				<div class="removeMain">
					<p>你确定要删除该供应商吗？</p>
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
	<script type="text/javascript" src="/js/rollpage.js"></script>
</body>
<script type="text/javascript">
	if("${msg}"){
		alert("${msg}");
	}
</script>
<c:remove var="msg" scope="session"/>

<!-- 分页 : 翻页按钮 -->
<script type="text/javascript">

	//判断, 当前是否是第一页
	if("${pa.currPage==1}" != "true"){
		$(".page-bar span:last a:eq(0)").attr("href", "/provider/query?currPage=1&pageSize=${pa.pageSize}");
		$(".page-bar span:last a:eq(1)").attr("href", "/provider/query?currPage=${pa.currPage-1}&pageSize=${pa.pageSize}");
	}

	//判断, 当前是否是最后页
	if("${pa.currPage==pa.totalPage}" != "true"){
		$(".page-bar span:last a:eq(2)").attr("href", "/provider/query?currPage=${pa.currPage+1}&pageSize=${pa.pageSize}");
		$(".page-bar span:last a:eq(3)").attr("href", "/provider/query?currPage=${pa.totalPage}&pageSize=${pa.pageSize}");
	}

</script>

<!-- 分页 : 跳转 -->
<script type="text/javascript">

	$(".page-bar [name='pageNum']").on("change", function(){

		//获取选中的页码
		var pageNum = $(".page-bar [name='pageNum'] option:selected").val();

		//跳转
		location = "/provider/query?pageSize=${pa.pageSize}&currPage="+pageNum;
	})

	$(".page-bar [name='pageCode']").next().on("click", function(){

		//alert("in")

		//获取文本框中的页码
		var pageCode = $(".page-bar [name='pageCode']").val();

		//验证, 是否是数值
		if(!/^\d+$/.test(pageCode)){
			$(".page-bar [name='pageCode']").val("${pa.currPage}");
			return;
		}

		//将数据转换成整数
		pageCode = parseInt(pageCode);

		//获取总页数
		var totalPage = parseInt("${pa.totalPage}");
		//获取当前页
		var currPage = parseInt("${pa.currPage}");

		//判断, 页码是否在合法范围
		if(pageCode < 1 || pageCode > totalPage){
			$(".page-bar [name='pageCode']").val("${pa.currPage}");
			return;
		}

		//判断, 页码是否是当前页
		if(pageCode == currPage){
			$(".page-bar [name='pageCode']").val("${pa.currPage}");
			return;
		}

		//跳转
		location = "/provider/query?pageSize=${pa.pageSize}&currPage="+pageCode;
	})
</script>

<!-- 分页:变更页面大小 -->
<script type="text/javascript">
	$(".page-bar [name='pageSize']").on("change", function(){

		//获取当前选中的页面大小
		var size = $(".page-bar [name='pageSize'] option:selected").val();

		//跳转
		location = "/provider/query?currPage=${pa.currPage}&pageSize="+size;

	})
</script>
</html>

