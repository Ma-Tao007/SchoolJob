package com.example.family.mapper;
import com.example.family.dto.PageHelper;
import com.example.family.entity.Sysuser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/*
@description
@anther  Administrator
@creater 2020-03-10 15:06
*/
@Mapper
public interface UserMapper {
//
//    int deleteByPrimaryKey(Integer id);
//
//    int insert(Sysuser record);
//
//    int insertSelective(Sysuser record);

    Sysuser selectByPrimaryKey(Integer id);

//    int updateByPrimaryKeySelective(Sysuser record);
//
//    int updateByPrimaryKey(Sysuser record);

    //通过用户名查找
    Sysuser selectByUsername(Sysuser record);

    List getAllList(PageHelper pageHelper);

    int getCount();
}
