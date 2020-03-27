package com.example.family.controller;

import com.example.family.dao.SysuserManager;
import com.example.family.dto.LayuiPageResult;
import com.example.family.dto.PageHelper;
import com.example.family.entity.Sysuser;
import com.example.family.service.SysuserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("sysuser")
public class SysuserController {
    @Resource
    SysuserService iUserSearch;
    @Resource
    SysuserManager sysuserManager;

    @RequestMapping("getPage")
    public String getPage(){
        return "sysuser/list";
    }

    @RequestMapping("getList")
    @ResponseBody
    public LayuiPageResult getList(PageHelper pageHelper){
       return iUserSearch.getAllList(pageHelper);
    }

    @RequestMapping("show")
    public String getShowPage(Integer id, ModelMap model){
        Sysuser user = iUserSearch.selectByPrimaryKey(id);
        model.put("sysuser",user);
        System.out.println("查找的数据："+user);
        return "sysuser/show";
    }

    @RequestMapping("update")
    @ResponseBody
    public void updateStatus(Integer id,Integer status){
        sysuserManager.updateStatus(id,status);
    }

    @ResponseBody
    @RequestMapping("delete")
    public void deleteByKey(Sysuser sysuser){
        sysuserManager.deleteByKey(sysuser);
    }
}
