package com.service;

import com.bean.entity.Order;
import com.bean.entity.Provider;
import com.bean.entity.User;
import com.bean.pojo.PageAssistant;
import com.bean.vo.OrderVo;
import com.bean.vo.ProviderVo;
import com.bean.vo.UserVo;
import com.exception.MyException;

import java.util.List;

public interface ProviderService {
    /** 查询用户列表 */
    List<ProviderVo> query();

    /** 修改 */
    void modify(Provider provider) throws MyException;

    /** 查询（单个用户） */
    ProviderVo unique(Provider provider) throws MyException;

    /** 删除 */
    void remove(Provider provider) throws MyException;

    /** 添加 */
    void add(Provider provider) throws MyException;

    /** 查询(分页) */
    PageAssistant<ProviderVo> query(PageAssistant<ProviderVo> pa);
}
