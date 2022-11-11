package com.service.impl;

import com.bean.entity.Order;
import com.bean.entity.User;
import com.bean.vo.OrderVo;
import com.bean.vo.UserVo;
import com.dao.OrderMapper;
import com.exception.MyException;
import com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Override
    public List<OrderVo> query() {
        List<OrderVo> list = orderMapper.select(new Order());

        return list;
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
}
