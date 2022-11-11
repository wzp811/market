package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

    @RequestMapping("/")
    public String defaultPage() {
        System.out.println("\n>>> default page");
        return "/login.jsp";
    }

}
