package com.example.family.controller;

import com.example.family.dto.LayuiPageResult;
import com.example.family.dto.PageHelper;
import com.example.family.service.IUserSearch;
import com.example.family.utils.JsonWrite;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
@RequestMapping("sysuser")
public class SysuserController {
    @Resource
    IUserSearch iUserSearch;

    @RequestMapping("getPage")
    public String getPage(){
        return "sysuser/list";
    }

    @RequestMapping("getList")
    @ResponseBody
    public LayuiPageResult getList(PageHelper pageHelper){
       return iUserSearch.getAllList(pageHelper);
    }
}
