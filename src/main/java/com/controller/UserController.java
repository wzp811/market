package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bean.entity.Role;
import com.bean.pojo.PageAssistant;
import com.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.entity.User;
import com.bean.vo.UserVo;
import com.exception.MyException;
import com.service.UserService;

@Controller //表示是一个业务控制器
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@RequestMapping("add")
	public String add(User user, HttpSession session) {
		System.out.println("\n>>> 用户: 添加");
		System.out.println(user);

		/* 处理业务 */
		try {
			//添加
			userService.add(user);
			//保存
			session.setAttribute("msg", "添加用户信息成功!");
			//跳转
			return "redirect:/user/query";
		} catch (MyException e) {
			e.printStackTrace();
			//保存错误提示
			session.setAttribute("msg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			//保存错误提示
			session.setAttribute("msg", "服务器走神了, 请重试~");
		}

		return "redirect:/page/user/add.jsp";
	}

	@RequestMapping("remove")
	public String remove(User user, HttpSession session) {
		System.out.println("\n>>> 用户: 删除");
		System.out.println(user);

		/* 处理业务 */
		try {
			//删除
			userService.remove(user);
			//保存
			session.setAttribute("msg", "删除用户信息成功!");
			//跳转
			return "redirect:/user/query";
		} catch (MyException e) {
			e.printStackTrace();
			//保存错误提示
			session.setAttribute("msg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			//保存错误提示
			session.setAttribute("msg", "服务器走神了, 请重试~");
		}

		return "redirect:/page/user/list.jsp";
	}
	
//	@RequestMapping("query")
//	public String query(HttpSession session) {
//		System.out.println("\n>>> 用户查询");
//
//		/* 处理业务 */
//		//查询
//		List<UserVo> userList = userService.query();
//
//		//保存数据
//		session.setAttribute("userList", userList);
//
//		return "/page/user/list.jsp";
//	}



	@RequestMapping("query")
	public String query(HttpSession session, PageAssistant<UserVo> pa) {
		System.out.println("\n>>> 用户查询(分页)");
		System.out.println(pa);

		/* 处理业务 */
		//查询
		pa = userService.query(pa);

		List<Role> roleList = roleService.queryAll();
		session.setAttribute("roleList", roleList);

		//保存数据
		session.setAttribute("pa", pa);

		return "/page/user/list.jsp";
	}
	
	
	@RequestMapping("login") //localhost:8080/user/login
	public String login(User user, HttpSession session) {
		System.out.println("\n>>> 用户登录");
		System.out.println(user);
		
		/* 处理业务 */
		try {
			//登录查询
			UserVo loginInfo = userService.login(user);
			
//			System.out.println("登录查询的数据结果:" + loginInfo);
			
			//保存数据到会话(session)
			session.setAttribute("loginInfo", loginInfo);
			
			//跳转到主页
			return "redirect:/page/main.jsp";
			
		} catch (MyException e) {
			e.printStackTrace();
			//保存错误提示
			session.setAttribute("msg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			//保存错误提示
			session.setAttribute("msg", "服务器走神了, 请重试~");
		} 
		
		//向外跳转的方式和路径
		return "redirect:/login.jsp";
	}

	@RequestMapping("modify")
	public String modify(User user, HttpSession session) {
		System.out.println("\n>>> 用户: 修改");
		System.out.println(user);

		try {
			userService.modify(user);
			session.setAttribute("msg", "修改用户信息成功！");
		} catch (MyException e) {
			e.printStackTrace();
			session.setAttribute("msg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("msg", "服务器走神了，请重试~");
		}
		return "redirect:/page/user/update.jsp";
	}

	@RequestMapping("unique")
	public String unique(User user, String page, HttpSession session) {
		System.out.println("\n>>> 用户：根据id查询");
		System.out.println(user);
		System.out.println(page);

		try {
			UserVo userInfo = userService.unique(user);
			List<Role> roleList = roleService.queryAll();

			session.setAttribute("userInfo", userInfo);
			session.setAttribute("roleList", roleList);

			return "/page/user/" + page + ".jsp";
		} catch (MyException e) {
			e.printStackTrace();
			//保存错误提示
			session.setAttribute("msg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			//保存错误提示
			session.setAttribute("msg", "服务器走神了, 请重试~");
		}

		return "redirect:/page/user/list.jsp";
	}

}
