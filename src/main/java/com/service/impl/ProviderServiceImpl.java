package com.service.impl;

import com.bean.entity.Order;
import com.bean.entity.Provider;
import com.bean.entity.Role;
import com.bean.entity.User;
import com.bean.pojo.PageAssistant;
import com.bean.vo.OrderVo;
import com.bean.vo.ProviderVo;
import com.bean.vo.UserVo;
import com.dao.OrderMapper;
import com.dao.ProviderMapper;
import com.exception.MyException;
import com.service.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ProviderServiceImpl implements ProviderService {

    @Autowired
    private ProviderMapper providerMapper;

    @Override
    public List<ProviderVo> query() {
        List<ProviderVo> list = providerMapper.select(new Provider());

        return list;
    }

    @Override
    public PageAssistant<ProviderVo> query(PageAssistant<ProviderVo> pa) {

        //构建map集合, 存放查询参数
        Map<String, Object> map = new HashMap<>();

        //查询总记录数
        pa.setCount(providerMapper.selectCount(map));

        //验证: currPage和totalPage的大小关系
        if(pa.getCurrPage() > pa.getTotalPage()) {
            pa.setCurrPage(pa.getTotalPage());
        }

        //添加分页参数
        map.put("start_code", pa.getStartCode());
        map.put("page_size", pa.getPageSize());

        //查询页面内容
        pa.setItems(providerMapper.selectByPage(map));

        return pa;
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


    @Override
    public void add(Provider provider) throws MyException {
        //添加
        int insert = providerMapper.insert(provider);

        //验证
        if(insert != 1)
            throw new MyException("添加用户失败!");
    }

    @Override
    public void remove(Provider provider) throws MyException {

        //删除
        int delete = providerMapper.delete(provider);

        //验证
        if(delete != 1)
            throw new MyException("删除用户失败!");
    }

}
