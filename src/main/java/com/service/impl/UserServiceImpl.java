package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.entity.User;
import com.bean.vo.UserVo;
import com.dao.UserMapper;
import com.exception.MyException;
import com.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserVo login(User user) throws MyException {
		
		List<UserVo> list = userMapper.select(user);
		
		//验证
		if(list.size() != 1) 
			throw new MyException("用户名或密码错误!");
		
		return list.get(0);
	}

	@Override
	public List<UserVo> query() {
		
		List<UserVo> list = userMapper.select(new User());
		
		return list;
	}

	@Override
	public void modify(User user) throws MyException {
		int update = userMapper.update(user);
		if (update != 1) {
			throw new MyException("修改用户信息失败!");
		}
	}

	@Override
	public UserVo unique(User user) throws MyException {
		List<UserVo> list = userMapper.select(user);
		if (list.size() != 1) {
			throw new MyException("用户ID有误，无法获取用户信息");
		}
		return list.get(0);
	}
}
