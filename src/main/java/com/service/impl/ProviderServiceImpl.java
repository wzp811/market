package com.service.impl;

import com.bean.entity.Order;
import com.bean.entity.Provider;
import com.bean.entity.Role;
import com.bean.vo.OrderVo;
import com.bean.vo.ProviderVo;
import com.dao.OrderMapper;
import com.dao.ProviderMapper;
import com.exception.MyException;
import com.service.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProviderServiceImpl implements ProviderService {

    @Autowired
    private ProviderMapper providerMapper;

    @Override
    public List<ProviderVo> query() {
        System.out.println("providerMapper: " + providerMapper);
        List<ProviderVo> list = providerMapper.select(new Provider());
        System.out.println(list);

        return list;
    }

    @Override
    public void modify(Provider provider) throws MyException {
        int update = providerMapper.update(provider);
        System.out.println("update:provider: " + provider);
        System.out.println(update);
        if (update != 1) {
            throw new MyException("修改订单信息失败!");
        }
    }

    @Override
    public ProviderVo unique(Provider provider) throws MyException {
        List<ProviderVo> list = providerMapper.select(provider);
        if (list.size() != 1) {
            throw new MyException("用户ID有误，无法获取用户信息");
        }
        return list.get(0);
    }

}
