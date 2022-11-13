package com.service.impl;

import com.bean.entity.Order;
import com.bean.entity.User;
import com.bean.pojo.PageAssistant;
import com.bean.vo.OrderVo;
import com.bean.vo.UserVo;
import com.dao.OrderMapper;
import com.exception.MyException;
import com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<OrderVo> query() {
        List<OrderVo> list = orderMapper.select(new Order());

        return list;
    }

    @Override
    public PageAssistant<OrderVo> query(PageAssistant<OrderVo> pa) {

        //构建map集合, 存放查询参数
        Map<String, Object> map = new HashMap<>();

        //查询总记录数
        pa.setCount(orderMapper.selectCount(map));

        //验证: currPage和totalPage的大小关系
        if(pa.getCurrPage() > pa.getTotalPage()) {
            pa.setCurrPage(pa.getTotalPage());
        }

        //添加分页参数
        map.put("start_code", pa.getStartCode());
        map.put("page_size", pa.getPageSize());

        //查询页面内容
        pa.setItems(orderMapper.selectByPage(map));

        return pa;
    }



    @Override
    public void modify(Order order) throws MyException {
        int update = orderMapper.update(order);
        if (update != 1) {
            throw new MyException("修改订单信息失败!");
        }
    }

    @Override
    public OrderVo unique(Order order) throws MyException {
        List<OrderVo> list = orderMapper.select(order);
        if (list.size() != 1) {
            throw new MyException("用户ID有误，无法获取用户信息");
        }
        return list.get(0);
    }


    @Override
    public void add(Order order) throws MyException {
        //添加
        int insert = orderMapper.insert(order);

        //验证
        if(insert != 1)
            throw new MyException("添加用户失败!");
    }

    @Override
    public void remove(Order order) throws MyException {

        //删除
        int delete = orderMapper.delete(order);

        //验证
        if(delete != 1)
            throw new MyException("删除用户失败!");
    }
}
