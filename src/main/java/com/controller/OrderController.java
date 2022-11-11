package com.controller;

import com.bean.entity.Order;
import com.bean.entity.Role;
import com.bean.entity.User;
import com.bean.vo.OrderVo;
import com.bean.vo.UserVo;
import com.exception.MyException;
import com.service.OrderService;
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

    @RequestMapping("query")
    public String query(HttpSession session) {
        System.out.println("\n>>> 订单查询");

        List<OrderVo> orderList = orderService.query();
        //保存数据
        session.setAttribute("orderList", orderList);

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

            session.setAttribute("orderInfo", orderInfo);

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
}
