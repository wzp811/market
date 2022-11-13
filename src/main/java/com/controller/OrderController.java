package com.controller;

import com.bean.entity.Order;
import com.bean.entity.Provider;
import com.bean.entity.Role;
import com.bean.entity.User;
import com.bean.pojo.PageAssistant;
import com.bean.vo.OrderVo;
import com.bean.vo.ProviderVo;
import com.bean.vo.UserVo;
import com.exception.MyException;
import com.service.OrderService;
import com.service.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProviderService providerService;

//    @RequestMapping("query")
//    public String query(HttpSession session) {
//        System.out.println("\n>>> 订单查询");
//
//        List<OrderVo> orderList = orderService.query();
//        //保存数据
//        session.setAttribute("orderList", orderList);
//
//        return "/page/order/list.jsp";
//    }



    @RequestMapping("query")
    public String query(HttpSession session, PageAssistant<OrderVo> pa) {
        System.out.println("\n>>> 订单查询(分页)");
        System.out.println(pa);

        /* 处理业务 */
        //查询
        pa = orderService.query(pa);

        List<ProviderVo> providerList = providerService.query();
        session.setAttribute("providerList", providerList);

        //保存数据
        session.setAttribute("pa", pa);

        return "/page/order/list.jsp";
    }

    @RequestMapping("modify")
    public String modify(Order order, HttpSession session) {
        System.out.println("\n>>> 订单: 修改");
        System.out.println(order);

        try {
            orderService.modify(order);
            session.setAttribute("msg", "修改用户信息成功！");
        } catch (MyException e) {
            e.printStackTrace();
            session.setAttribute("msg", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "服务器走神了，请重试~");
        }
        return "redirect:/page/order/update.jsp";
    }

    @RequestMapping("unique")
    public String unique(Order order, String page, HttpSession session) {
        System.out.println("\n>>> 订单：根据id查询");
        System.out.println(order);
        System.out.println(page);

        try {
            OrderVo orderInfo = orderService.unique(order);
            List<ProviderVo> providerList = providerService.query();

            session.setAttribute("orderInfo", orderInfo);
            session.setAttribute("providerList", providerList);

            return "/page/order/" + page + ".jsp";
        } catch (MyException e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", "服务器走神了, 请重试~");
        }

        return "redirect:/page/order/list.jsp";
    }


    @RequestMapping("add")
    public String add(Order order, HttpSession session) {
        System.out.println("\n>>> 用户: 添加");
        System.out.println(order);

        /* 处理业务 */
        try {
            //添加
            orderService.add(order);
            //保存
            session.setAttribute("msg", "添加订单信息成功!");
            //跳转
            return "redirect:/order/query";
        } catch (MyException e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", "服务器走神了, 请重试~");
        }

        return "redirect:/page/order/add.jsp";
    }

    @RequestMapping("remove")
    public String remove(Order order, HttpSession session) {
        System.out.println("\n>>> 订单: 删除");
        System.out.println(order);

        /* 处理业务 */
        try {
            //删除
            orderService.remove(order);
            //保存
            session.setAttribute("msg", "删除用户信息成功!");
            //跳转
            return "redirect:/order/query";
        } catch (MyException e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            //保存错误提示
            session.setAttribute("msg", "服务器走神了, 请重试~");
        }

        return "redirect:/page/order/list.jsp";
    }
}
