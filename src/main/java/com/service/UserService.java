package com.service;

import java.util.List;

import com.bean.entity.User;
import com.bean.pojo.PageAssistant;
import com.bean.vo.UserVo;
import com.exception.MyException;

/**
 * 用户业务逻辑接口
 * @author SZU
 *
 */
public interface UserService {

	/** 登录业务 
	 * @throws MyException */
	UserVo login(User user) throws MyException;
	
	/** 查询用户列表 */
	List<UserVo> query();

	/** 修改 */
	void modify(User user) throws MyException;

	/** 查询（单个用户） */
	UserVo unique(User user) throws MyException;

	/** 删除 */
	void remove(User user) throws MyException;

	/** 添加 */
	void add(User user) throws MyException;

	/** 查询(分页) */
	PageAssistant<UserVo> query(PageAssistant<UserVo> pa);
}
