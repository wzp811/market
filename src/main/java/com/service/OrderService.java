package com.service;

import com.bean.entity.Order;
import com.bean.entity.User;
import com.bean.vo.OrderVo;
import com.bean.vo.UserVo;
import com.exception.MyException;

import java.util.List;

public interface OrderService {

    /** 查询用户列表 */
    List<OrderVo> query();

    /** 修改 */
    void modify(Order order) throws MyException;

    /** 查询（单个用户） */
    OrderVo unique(Order order) throws MyException;
}
