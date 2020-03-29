package com.example.family.controller;

import com.example.family.dto.LayuiPageResult;
import com.example.family.dto.PageHelper;
import com.example.family.entity.Company;
import com.example.family.entity.Sysuser;
import com.example.family.service.CompanyService;
import com.example.family.utils.JsonWrite;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("company")
public class CompanyController {

    @Resource
    CompanyService companyService;

    @RequestMapping("getPage")
    public String getPage(HttpSession session) {
        Sysuser sysuser = (Sysuser)session.getAttribute("sessioninfo");
        String url = "";
        //1是管理员
        if(sysuser.getKind()==1){
            url = "company/list";
        }else{
            url = "student/company";
        }
        return url;
    }

    @RequestMapping("getList")
    @ResponseBody
    public LayuiPageResult getList(PageHelper pageHelper,Company company){

        return companyService.getAllList(pageHelper,company);
    }

    @RequestMapping("show")
    public String getShowPage(Integer id,Integer type, ModelMap model){
        Company company = companyService.selectByPrimaryKey(id);
        model.put("company",company);
        return type==0?"company/show":"company/updata";
    }

    @RequestMapping("updata")
    @ResponseBody
    public JsonWrite updateStatus(Company company){
        //查看企业编码不可重复
        Boolean isexit = companyService.selectIsExit(company);
        if(!isexit){
            companyService.updateByPrimaryKey(company);
            return JsonWrite.SUCCESS("编辑成功");
        }
        return JsonWrite.ERROR("企业编码已存在");
    }

    @RequestMapping("addPage")
    public String getAddPage( ModelMap model){
        model.put("company",new Company());
        return "company/add";
    }

    @RequestMapping("add")
    @ResponseBody
    public JsonWrite add(Company company){
        //查看企业编码不可重复
        Boolean isexit = companyService.selectIsExit(company);
        if(!isexit){
            companyService.insert(company);
            return JsonWrite.SUCCESS("编辑成功");
        }
        return JsonWrite.ERROR("企业编码已存在");
    }

    @RequestMapping("getUser")
    @ResponseBody
    public JsonWrite getUser(HttpSession session){
        //查看企业编码不可重复
        Sysuser sysuser = (Sysuser) session.getAttribute("sessioninfo");
        return JsonWrite.SUCCESS(sysuser);
    }

}
