package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bean.pojo.PageAssistant;
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
	public PageAssistant<UserVo> query(PageAssistant<UserVo> pa) {

		//构建map集合, 存放查询参数
		Map<String, Object> map = new HashMap<>();

		//查询总记录数
		pa.setCount(userMapper.selectCount(map));

		//验证: currPage和totalPage的大小关系
		if(pa.getCurrPage() > pa.getTotalPage()) {
			pa.setCurrPage(pa.getTotalPage());
		}

		//添加分页参数
		map.put("start_code", pa.getStartCode());
		map.put("page_size", pa.getPageSize());

		//查询页面内容
		pa.setItems(userMapper.selectByPage(map));

		return pa;
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

	@Override
	public void add(User user) throws MyException {
		//添加
		int insert = userMapper.insert(user);

		//验证
		if(insert != 1)
			throw new MyException("添加用户失败!");
	}

	@Override
	public void remove(User user) throws MyException {

		//删除
		int delete = userMapper.delete(user);

		//验证
		if(delete != 1)
			throw new MyException("删除用户失败!");
	}
}
