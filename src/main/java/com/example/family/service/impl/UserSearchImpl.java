package com.example.family.service.impl;

import com.example.family.dto.LayuiPageResult;
import com.example.family.dto.PageHelper;
import com.example.family.entity.Sysuser;
import com.example.family.mapper.UserMapper;
import com.example.family.service.IUserSearch;
import com.example.family.utils.JsonWrite;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/*
@description
@anther  Administrator
@creater 2020-03-10 15:04
*/
@Service
public class UserSearchImpl implements IUserSearch {
    @Resource
    private UserMapper userMapper;
    @Override
    public JsonWrite selectUserByUsername(Sysuser user) {
        //由于不需要操作数据库，所以在这里执行查询操作
        Sysuser selUser = userMapper.selectByUsername(user);
        //验证信息
        if(null == selUser){
            return JsonWrite.CUSTOMIZE("401",false,"用户名不存在");
        }else if(!selUser.getPassword().equals(user.getPassword())){
            return JsonWrite.CUSTOMIZE("401",false,"密码错误");
        }else{
            return JsonWrite.CUSTOMIZE("200",true,"登陆成功");
        }
    }

    @Override
    public LayuiPageResult getAllList(PageHelper pageHelper) {
        LayuiPageResult lpr = new LayuiPageResult();
        lpr.setData(userMapper.getAllList(pageHelper));
        lpr.setMsg("获取列表成功");
        lpr.setCount(userMapper.getCount());
        return lpr;
    }
}
