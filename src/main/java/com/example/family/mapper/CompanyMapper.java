package com.example.family.mapper;

import com.example.family.entity.Company;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CompanyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);

    int getCount(Company company);

    List<Company> getAllList(Company company);

    Company isExitNo(Company company);
}