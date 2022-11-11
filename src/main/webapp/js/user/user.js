$(function () {

    //分页数据函数开始
    function getPageInfo(currentPage, userName, userRole) {
        var data = new Object();
        data.opr = "getPageList";
        data.currentPage = currentPage;
        if (userName != null && userName != "") {
            data.userName = userName;
        }
        if (userRole != null && userRole != "") {
            data.userRole = userRole;
        }

        $.ajax({
            "url": ctx + "/jsp/admin/user",
            "data": data,
            "type": "get",
            "dataType": "json",
            "success": function (result) {
                var roleList = result.roleList;
                var page = result.page;
                var pageList = result.page.pageList;
                //1.将right中的div值为空
                $(".right").html("");

                //2.1添加查询行
                $(".right").html('<div class="location">'
                    + '<strong>你现在所在的位置是:</strong> <span>用户管理页面</span>'
                    + '</div>'
                    + '<div class="search">'
                    + '<form method="" action="#">'
                    + '	<span>用户名：</span> <input name="queryname" class="input-text" type="text" value="">'
                    + '	<span>用户角色：</span>'
                    + '	<select name="queryUserRole" >'
                    + '		<option value="0">--请选择--</option>'
                    + '	</select>'
                    + '	<input type="hidden" name="pageIndex" value="1" />'
                    + '	<input value="查 询" type="button" id="searchbutton"> <a href="javascript:;" id="addUser">添加用户</a>'
                    + '</form>'
                    + '</div>');
                //2.2添加角色列表
                if (roleList != null) {
                    for (var i = 0; i < roleList.length; i++) {
                        var str = $('<option value="' + roleList[i].id + '">' + roleList[i].roleName + '</option>');
                        $(".right select").append(str);
                    }
                }

                //2.3添加table结构
                $(".right").append($('<!--用户-->'
                    + '<table class="providerTable">'
                    + '<tr class="firstTr">'
                    + '	<th width="10%">用户编码</th>'
                    + '	<th width="20%">用户名称</th>'
                    + '	<th width="10%">性别</th>'
                    + '	<th width="10%">年龄</th>'
                    + '	<th width="10%">电话</th>'
                    + '	<th width="10%">用户角色</th>'
                    + '	<th width="30%">操作</th>'
                    + '</tr>'
                    + '</table>'));

                //2.4添加用户列表信息
                if (pageList != null) {
                    for (var i = 0; i < pageList.length; i++) {
                        var sex = "";
                        if (pageList[i].gender == 1) {
                            sex = "男";
                        } else {
                            sex = "女";
                        }

                        var str = $('<tr>'
                            + '<td><span>' + pageList[i].userCode + '</span></td>'
                            + '<td><span>' + pageList[i].userName + '</span></td>'
                            + '<td><span>' + sex + '</span></td>'
                            + '<td><span>' + pageList[i].age + '</span></td>'
                            + '<td><span>' + pageList[i].phone + '</span></td>'
                            + '<td><span>' + pageList[i].userRoleName + '</span></td>'
                            + '<td>'
                            + '	<span>'
                            + '		<a class="viewUser" href="javascript:;" id="' + pageList[i].id + '">'
                            + '			<img src=' + ctx + '"/statics/images/read.png" alt="查看" title="查看" />'
                            + '			</a>'
                            + '	</span> '
                            + '	<span>'
                            + '		<a class="modifyUser" href="javascript:;" id="' + pageList[i].id + '">'
                            + '			<img src=' + ctx + '"/statics/images/xiugai.png" alt="修改" title="修改" />'
                            + '		</a>'
                            + '	</span> '
                            + '	<span>'
                            + '		<a class="deleteUser" href="javascript:;" id="' + pageList[i].id + '">'
                            + '			<img src=' + ctx + '"/statics/images/schu.png" alt="删除" title="删除" />'
                            + '		</a>'
                            + '	</span>'
                            + '</td>'
                            + '</tr>');
                        $(".right .providerTable").append(str);
                    }
                }

                //2.6隐藏数据
                $(".right").append($('<input type="hidden" id="currentPage" value="' + page.currentPage + '" />'));
                $(".right").append($('<input type="hidden" id="totalPageCount" value="' + page.totalPageCount + '" />'));

                //2.5添加分页信息
                $(".right").append($('<div class="page-bar">'
                    + '<ul class="page-num-ul clearfix">'
                    + '<li>共' + page.totalCount + '条记录&nbsp;&nbsp; ' + page.currentPage + '/' + page.totalPageCount + '页'
                    + '	<a href="javascript:;" class="firstPage">首页</a>'
                    + '	<a href="javascript:;" class="prevPage">上一页</a>'
                    + '	<a href="javascript:;" class="nextPage">下一页</a>'
                    + '	<a href="javascript:;" class="lastPage">尾页</a>'
                    + '</li>'
                    + '</ul>'
                    + '<span class="page-go-form"><label>跳转至</label> '
                    + '<input type="text" name="inputPage" id="inputPage" class="page-key" />页'
                    + '<button type="button" class="page-btn">GO</button>'
                    + '</span>'
                    + '</div>'));
                //2.7处理跳转控制
                if (page.currentPage <= 1) {
                    $(".firstPage").hide();
                    $(".prevPage").hide();
                }
                if (page.currentPage >= page.totalPageCount) {
                    $(".nextPage").hide();
                    $(".lastPage").hide();
                }

                //重新将筛选条件写入到页面中
                $(".search .input-text").val(userName);
                if (userRole > 0) {
                    $(".search select option").each(function () {
                        if ($(this).val() == userRole) {
                            $(this).attr("selected", "selected");
                        }
                    });
                }
            },
            "error": function () {
                alert("错误");
            }


        })
    }

    //分页数据函数结束

    //用户管理点击事件开始
    $("body").on("click", ".list .user", function () {
        getPageInfo(1, null, null);

    });
    //用户管理点击事件结束

    //首页点击事件开始
    $("body").on("click", ".firstPage", function () {
        var userName = $(".search .input-text").val();
        var userRole = $(".search select").val();
        var currentPage = parseInt($("#currentPage").val());
        getPageInfo(1, userName, userRole);

    });
    //首页点击事件结束

    //上一页点击事件开始
    $("body").on("click", ".prevPage", function () {
        var userName = $(".search .input-text").val();
        var userRole = $(".search select").val();
        var currentPage = parseInt($("#currentPage").val());
        getPageInfo((currentPage - 1), userName, userRole);

    });
    //上一页点击事件结束

    //下一页点击事件开始
    $("body").on("click", ".nextPage", function () {
        var userName = $(".search .input-text").val();
        var userRole = $(".search select").val();
        var currentPage = parseInt($("#currentPage").val());
        getPageInfo((currentPage + 1), userName, userRole);

    });
    //下一页点击事件结束

    //尾页点击事件开始
    $("body").on("click", ".lastPage", function () {
        var userName = $(".search .input-text").val();
        var userRole = $(".search select").val();
//		var currentPage=parseInt($("#currentPage").val());
        var totalPageCount = parseInt($("#totalPageCount").val());
        getPageInfo(totalPageCount, userName, userRole);

    });
    //尾页点击事件结束

    //go点击事件开始
    $("body").on("click", ".page-btn", function () {
        var userName = $(".search .input-text").val();
        var userRole = $(".search select").val();

        var wantPage = parseInt($("#inputPage").val());
        var totalPageCount = parseInt($("#totalPageCount").val());
        if (wantPage > totalPageCount || wantPage < 1) {
            $(".zhezhao").show();
            $(".remove").show();
            $(".remove .removeMain p").html("输入的页面已经超出了范围");
        } else {
            getPageInfo(wantPage, userName, userRole);
        }
    });
    //go点击事件结束

    //确定按钮点击开始
    $("body").on("click", "#yes", function () {
        $(".zhezhao").hide();
        $(".remove").hide();
    });
    //确定按钮点击结束

    //条件查询按钮点击事件
    $("body").on("click", "#searchbutton", function () {
        //获取条件查询的值
        var userName = $(".search .input-text").val();
        var userRole = $(".search select").val();
        getPageInfo(1, userName, userRole);

    });
    //条件查询按钮点击事件结束

    //修改按钮点击事件开始
    $("body").on("click", ".modifyUser", function () {
        //根据id获取信息
        var id = $(this).attr("id");
        var currentPage = parseInt($("#currentPage").val());
        //获取条件查询的值
        var userName = $(".search .input-text").val();
        var userRole = $(".search select").val();
        $.ajax({
            "url": ctx + "/jsp/admin/user",
            "data": {"opr": "getUserById", "id": id, "currentPage": currentPage},
            "type": "get",
            "dataType": "json",
            "success": function (result) {
                $(".right").html('');//清空原始数据
                var user = result.user;
                var roleList = result.roleList;
                var str = $('<div class="location">'
                    + '<strong>你现在所在的位置是:</strong>'
                    + '<span>用户管理页面 >> 用户修改页面</span>'
                    + '</div>'
                    + '<div class="providerAdd">'
                    + '<form id="userForm" name="userForm" method="post" action="">'
                    + '    <input type="hidden" id="pageUserName" value="' + userName + '" />'
                    + '    <input type="hidden" id="pageUserRole" value="' + userRole + '" />'
                    + '    <input type="hidden" id="currentPage" value="' + currentPage + '" />'
                    + '    <input type="hidden" name="opr" value="udpateUser">'
                    + '    <input type="hidden" name="id" value="' + user.id + '"/>'
                    + '    <div>'
                    + '        <label for="userName">用户名称：</label>'
                    + '        <input type="text" name="userName" id="userName" value="' + user.userName + '">'
                    + '        <font color="red"></font>'
                    + '    </div>'
                    + '    <div>'
                    + '        <label >用户性别：</label>'
                    + '        <select name="gender" id="gender">'
                    + '        	<option value="1">男</option>'
                    + '          <option value="2">女</option>'
                    + '		</select>'
                    + '    </div>'
                    + '    <div>'
                    + '        <label for="data">出生日期：</label>'
                    + '        <input type="text" Class="Wdate" id="birthday" name="birthday" value="' + user.birthday + '"'
                    + '               readonly="readonly" onclick="WdatePicker();">'
                    + '       <font color="red"></font>'
                    + '   </div>'
                    + '    <div>'
                    + '        <label for="userphone">用户电话：</label>'
                    + '        <input type="text" name="phone" id="phone" value="' + user.phone + '">'
                    + '       <font color="red"></font>'
                    + '   </div>'
                    + '   <div>'
                    + '        <label for="userAddress">用户地址：</label>'
                    + '         <input type="text" name="address" id="address" value="' + user.address + '">'
                    + '    </div>'
                    + '   <div>'
                    + '        <label >用户角色：</label>'
                    + '        <input type="hidden" value="3" id="rid" />'
                    + '        <select name="userRole" id="userRole">'
                    + '        </select>'
                    + '        <font color="red"></font>'
                    + '    </div>'
                    + '    <div class="providerAddBtn">'
                    + '        <input type="button" name="save" id="modifysave" value="保存" />'
                    + '        <input type="button" id="modifyback" name="back" value="返回"/>'
                    + '    </div>'
                    + ' </form>'
                    + '</div>');
                //追加
                $(".right").append(str);

                //修改性别的选项
                $("#gender option").each(function () {
                    if ($(this).val() == user.gender) {
                        $(this).attr("selected", "selected");
                    }
                });
                //添加角色列表
                for (var i = 0; i < roleList.length; i++) {
                    var optionStr = "";

                    if (roleList[i].id == user.userRole) {
                        optionStr = '<option value="' + roleList[i].id + '" selected>' + roleList[i].roleName + '</option>';
                    } else {
                        optionStr = '<option value="' + roleList[i].id + '">' + roleList[i].roleName + '</option>';
                    }
                    $("#userRole").append($(optionStr));
                }
            }
        });


    });
    //修改按钮点击事件结束

    //保存按钮点击事件开始
    $("body").on("click", "#modifysave", function () {
        //获取条件查询的值
        var pageUserName = $("#pageUserName").val();
        var pageUserRole = $("#pageUserRole").val();
        //获取表单数据
        var data = $("#userForm").serialize();
        $.ajax({
            "url": ctx + "/jsp/admin/user",
            "data": data,
            "type": "get",
            "dataType": "text",
            "success": function (result) {
                var currentPage = parseInt($("#currentPage").val());
                getPageInfo(currentPage, pageUserName, pageUserRole);
            }
        });
    });
    //保存按钮点击事件结束

    //添加用户按钮点击事件开始
    $("body").on("click", "#addUser", function () {
        var currentPage = parseInt($("#currentPage").val());
        //获取条件查询的值
        var userName = $(".search .input-text").val();
        var userRole = $(".search select").val();
        //清空所有主体右侧内容
        $(".right").html('');
        //添加新增页面内容
        var str = '<div class="location">\n' +
            '            <strong>你现在所在的位置是:</strong>\n' +
            '            <span>用户管理页面 >> 用户添加页面</span>\n' +
            '        </div>\n' +
            '        <div class="providerAdd">\n' +
            '            <form id="userForm" name="userForm" method="post" action="jsp/user.do">\n' +
            '               <input type="hidden" name="opr" value="addUser">' +
            '               <input type="hidden" id="pageUserName" value="' + userName + '" />' +
            '               <input type="hidden" id="pageUserRole" value="' + userRole + '" />' +
            '               <input type="hidden" id="currentPage" value="' + currentPage + '" />' +
            '                <!--div的class 为error是验证错误，ok是验证成功-->\n' +
            '                <div>\n' +
            '                    <label for="userCode">用户编码：</label>\n' +
            '                    <input type="text" name="userCode" id="userCode" value="">\n' +
            '                    <!-- 放置提示信息 -->\n' +
            '                    <font color="red"></font>\n' +
            '                </div>\n' +
            '                <div>\n' +
            '                    <label for="userName">用户名称：</label>\n' +
            '                    <input type="text" name="userName" id="userName" value="">\n' +
            '                    <font color="red"></font>\n' +
            '                </div>\n' +
            '                <div>\n' +
            '                    <label for="userPassword">用户密码：</label>\n' +
            '                    <input type="password" name="userPassword" id="userPassword" value="">\n' +
            '                    <font color="red"></font>\n' +
            '                </div>\n' +
            '                <div>\n' +
            '                    <label for="ruserPassword">确认密码：</label>\n' +
            '                    <input type="password" name="ruserPassword" id="ruserPassword" value="">\n' +
            '                    <font color="red"></font>\n' +
            '                </div>\n' +
            '                <div>\n' +
            '                    <label>用户性别：</label>\n' +
            '                    <select name="gender" id="gender">\n' +
            '                        <option value="1" selected="selected">男</option>\n' +
            '                        <option value="2">女</option>\n' +
            '                    </select>\n' +
            '                </div>\n' +
            '                <div>\n' +
            '                    <label for="birthday">出生日期：</label>\n' +
            '                    <input type="text" Class="Wdate" id="birthday" name="birthday"\n' +
            '                           readonly="readonly" onclick="WdatePicker();">\n' +
            '                    <font color="red"></font>\n' +
            '                </div>\n' +
            '                <div>\n' +
            '                    <label for="phone">用户电话：</label>\n' +
            '                    <input type="text" name="phone" id="phone" value="">\n' +
            '                    <font color="red"></font>\n' +
            '                </div>\n' +
            '                <div>\n' +
            '                    <label for="address">用户地址：</label>\n' +
            '                    <input name="address" id="address" value="">\n' +
            '                </div>\n' +
            '                <div>\n' +
            '                    <label>用户角色：</label>\n' +
            '                    <!-- 列出所有的角色分类 -->\n' +
            '                    <select name="userRole" id="userRole">' +
            '                       <option value="0">--请选择--</option></select>\n' +
            '                    <font color="red"></font>\n' +
            '                </div>\n' +
            '                <div class="providerAddBtn">\n' +
            '                    <input type="button" name="add" id="addsave" value="保存">\n' +
            '                    <input type="button" id="saveback" name="back" value="返回">\n' +
            '                </div>\n' +
            '            </form>\n' +
            '        </div>';

        $(".right").html($(str));

        //获取用户角色列表
        $.ajax({
            "url": ctx + "/jsp/admin/role",
            "data": {"opr": "getRoleList"},
            "type": "get",
            "dataType": "json",
            "success": function (result) {
                var roleList = result;
                //追加用户角色
                for (var i = 0; i < roleList.length; i++) {
                    $("#userRole").append($('<option value="' + roleList[i].id + '">' + roleList[i].roleName + '</option></select>'));
                }
            }
        });
    });
    //添加用户按钮点击事件结束

    //用户编码失焦事件(验证用户编码是否存在)开始
    $("body").on("blur", "#userCode", function () {
        var userCode = $(this).val();
        var userCodeEle = $(this);
        //获取用户角色列表
        $.ajax({
            "url": ctx + "/jsp/admin/user",
            "data": {"opr": "getUserCode", "userCode": userCode},
            "type": "get",
            "dataType": "text",
            "success": function (result) {
                if (result == "true") {//可以使用
                    userCodeEle.next().html("用户编码可以使用");
                } else {//用户编码已经存在,不能使用
                    userCodeEle.next().html("用户编码已经存在,不能使用");
                }
            }
        });
    });
    //用户编码失焦事件(验证用户编码是否存在)结束

    //新增保存按钮点击事件开始
    $("body").on("click", "#addsave", function () {
        //获取条件查询的值
        var pageUserName = $("#pageUserName").val();
        var pageUserRole = $("#pageUserRole").val();
        //获取表单数据
        var data = $("#userForm").serialize();
        $.ajax({
            "url": ctx + "/jsp/admin/user",
            "data": data,
            "type": "post",
            "dataType": "text",
            "success": function (result) {
                var currentPage = parseInt($("#currentPage").val());
                getPageInfo(currentPage, pageUserName, pageUserRole);
            }
        });
    });

    //删除用户点击事件开始
    $("body").on("click", ".deleteUser", function () {
        //获取表单数据
        var id = $(this).attr("id");
        $(".zhezhao").show();
        $(".removeMain").attr("id", id);
        $("#removeUse").show();

    });

    $("body").on("click", "#yes", function () {
        var id = $(".removeMain").attr("id");
        //获取条件查询的值
        var pageUserName = $("#pageUserName").val();
        var pageUserRole = $("#pageUserRole").val();
        $.ajax({
            "url": ctx + "/jsp/admin/user",
            "data": {"id": id, "opr": "delUser"},
            "type": "get",
            "dataType": "text",
            "success": function (result) {
                var currentPage = parseInt($("#currentPage").val());
                getPageInfo(currentPage, pageUserName, pageUserRole);
            }
        });
    });

    //删除用户点击事件结束

    //修改界面返回按钮点击事件开始
    $("body").on("click", "#modifyback", function () {
        //获取条件查询的值
        var userName = $("#pageUserName").val();
        var userRole = $("#pageUserRole").val();
        var currentPage = parseInt($("#currentPage").val());
        getPageInfo(currentPage, userName, userRole);

    });
    //修改按钮点击事件结束

    //新增界面返回按钮点击事件开始
    $("body").on("click", "#saveback", function () {
        //获取条件查询的值
        var userName = $("#pageUserName").val();
        var userRole = $("#pageUserRole").val();
        var currentPage = parseInt($("#currentPage").val());
        getPageInfo(currentPage, userName, userRole);

    });
    //新增界面返回按钮点击事件结束

    //查看用户界面点击事件开始
    $("body").on("click", ".viewUser", function () {
        var id = $(this).attr("id");
        var currentPage = parseInt($("#currentPage").val());
        //获取条件查询的值
        var userName = $(".search .input-text").val();
        var userRole = $(".search select").val();

        //清空所有数据
        $(".right").html('');
        $.ajax({
            "url": ctx + "/jsp/admin/user",
            "data": {"id": id, "opr": "viewUser"},
            "type": "get",
            "dataType": "json",
            "success": function (result) {
                var sex = "";
                if (result.gender == 1) {
                    sex = "男";
                } else {
                    sex = "女";
                }
                var str = $('<div class="location">\n' +
                    '            <strong>你现在所在的位置是:</strong>\n' +
                    '            <span>用户管理页面 >> 用户信息查看页面</span>\n' +
                    '        </div>\n' +
                    '        <input type="hidden" id="pageUserName" value="' + userName + '" />' +
                    '        <input type="hidden" id="pageUserRole" value="' + userRole + '" />' +
                    '        <input type="hidden" id="currentPage" value="' + currentPage + '" />' +
                    '        <div class="providerView">\n' +
                    '            <p><strong>用户编号：</strong><span>' + result.userCode + '</span></p>\n' +
                    '            <p><strong>用户名称：</strong><span>' + result.userName + '</span></p>\n' +
                    '            <p><strong>用户性别：</strong><span>' + sex + '</span></p>\n' +
                    '            <p><strong>出生日期：</strong><span>' + result.birthday + '</span></p>\n' +
                    '            <p><strong>用户电话：</strong><span>' + result.phone + '</span></p>\n' +
                    '            <p><strong>用户地址：</strong><span>' + result.address + '</span></p>\n' +
                    '            <p><strong>用户角色：</strong><span>' + result.userRoleName + '</span></p>\n' +
                    '            <div class="providerAddBtn">\n' +
                    '                <input type="button" id="viewback" name="back" value="返回">\n' +
                    '            </div>');
                $(".right").append(str);
            }
        });
    });
    //查看用户界面点击事件结束

    //新增界面返回按钮点击事件开始
    $("body").on("click", "#viewback", function () {
        //获取条件查询的值
        var userName = $("#pageUserName").val();
        var userRole = $("#pageUserRole").val();
        var currentPage = parseInt($("#currentPage").val());
        getPageInfo(currentPage, userName, userRole);

    });
    //新增界面返回按钮点击事件结束

})