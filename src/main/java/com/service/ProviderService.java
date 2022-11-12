package com.service;

import com.bean.entity.Order;
import com.bean.entity.Provider;
import com.bean.vo.OrderVo;
import com.bean.vo.ProviderVo;
import com.exception.MyException;

import java.util.List;

public interface ProviderService {
    /** 查询用户列表 */
    List<ProviderVo> query();

    /** 修改 */
    void modify(Provider provider) throws MyException;

    /** 查询（单个用户） */
    ProviderVo unique(Provider provider) throws MyException;
}
