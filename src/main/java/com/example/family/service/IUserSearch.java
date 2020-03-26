package com.example.family.service;

import com.example.family.dto.LayuiPageResult;
import com.example.family.dto.PageHelper;
import com.example.family.entity.Sysuser;
import com.example.family.utils.JsonWrite;

import javax.servlet.http.HttpSession;

/*
@description
@anther  Administrator
@creater 2020-03-10 15:03
*/
public interface IUserSearch {
    //根据用户名去查询用户信息
    JsonWrite selectUserByUsername(Sysuser user, HttpSession sessioninfo);

    LayuiPageResult getAllList(PageHelper pageHelper);

    Sysuser selectUserById(Integer id);
}
