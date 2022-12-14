package com.controller;

import com.bean.entity.Order;
import com.bean.entity.Provider;
import com.bean.pojo.PageAssistant;
import com.bean.vo.OrderVo;
import com.bean.vo.ProviderVo;
import com.exception.MyException;
import com.service.OrderService;
import com.service.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("provider")
public class ProviderController {
    @Autowired
    private ProviderService providerService;

//    @RequestMapping("query")
//    public String query(HttpSession session) {
//        System.out.println("\n>>> 供应商查询");
//
//        System.out.println("providerService: " + providerService);
//        List<ProviderVo> providerList = providerService.query();
//        //保存数据
//        session.setAttribute("providerList", providerList);
//
//        return "/page/provider/list.jsp";
//    }

    @RequestMapping("query")
    public String query(HttpSession session, PageAssistant<ProviderVo> pa) {
        System.out.println("\n>>> 供应商查询(分页)");
        System.out.println(pa);

        /* 处理业务 */
        //查询
        pa = providerService.query(pa);

        //保存数据
        session.setAttribute("pa", pa);

        return "/page/provider/list.jsp";
    }

    @RequestMapping("modify")
    public String modify(Provider provider, HttpSession session) {
        System.out.println("\n>>> 供应商: 修改");
        System.out.println(provider);

        try {
            providerService.modify(provider);
            session.setAttribute("msg", "修改供应商信息成功！");
        } catch (MyException e) {
            e.printStackTrace();
            session.setAttribute("msg", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "服务器走神了，请重试~");
        }
        return "redirect:/page/provider/update.jsp";
    }

    @RequestMapping("unique")
    public String unique(Provider provider, String page, HttpSession session) {
        System.out.println("\n>>> 供应商：根据id查询");
        System.out.println(provider);
        System.out.println(page);

        try {
            ProviderVo providerInfo = providerService.unique(provider);

            session.setAttribute("providerInfo", providerInfo);

            return "/page/provider/" + page + ".jsp";
        } catch (MyException e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", "服务器走神了, 请重试~");
        }

        return "redirect:/page/provider/list.jsp";
    }


    @RequestMapping("add")
    public String add(Provider provider, HttpSession session) {
        System.out.println("\n>>> 用户: 添加");
        System.out.println(provider);

        /* 处理业务 */
        try {
            //添加
            providerService.add(provider);
            //保存
            session.setAttribute("msg", "添加供应商信息成功!");
            //跳转
            return "redirect:/provider/query";
        } catch (MyException e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", "服务器走神了, 请重试~");
        }

        return "redirect:/page/provider/add.jsp";
    }

    @RequestMapping("remove")
    public String remove(Provider provider, HttpSession session) {
        System.out.println("\n>>> 供应商: 删除");
        System.out.println(provider);

        /* 处理业务 */
        try {
            //删除
            providerService.remove(provider);
            //保存
            session.setAttribute("msg", "删除供应商信息成功!");
            //跳转
            return "redirect:/provider/query";
        } catch (MyException e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", "服务器走神了, 请重试~");
        }

        return "redirect:/page/provider/list.jsp";
    }
}
