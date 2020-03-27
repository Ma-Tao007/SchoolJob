package com.example.family.controller;


import com.example.family.entity.Sysuser;
import com.example.family.service.SysuserService;
import com.example.family.utils.JsonWrite;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/*
@description
@anther  Administrator
@creater 2020-03-09 17:15
*/
@Controller
public class LoginController {
    @Resource
    private SysuserService userSearch;
    @RequestMapping("/")
    public String index() {
        return "login/login";
    }

    @RequestMapping("/login/main")
    @ResponseBody
    public JsonWrite getLoginPage(Sysuser user, HttpSession sessioninfo) {
        return userSearch.selectUserByUsername(user,sessioninfo);
    }

    @RequestMapping("index")
    public String getIndexPage(){
        return "index";
    }

    @RequestMapping("getLoginMsg")
    @ResponseBody
    public JsonWrite getLoginMsg(HttpSession session){
        Sysuser sessioninfo = (Sysuser) session.getAttribute("sessioninfo");
        if(null!=sessioninfo){
            return JsonWrite.CUSTOMIZE("202",true,sessioninfo.getUsername());
        }
        return null;
    }
}
