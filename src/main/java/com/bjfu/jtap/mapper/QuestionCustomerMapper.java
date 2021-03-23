package com.bjfu.jtap.mapper;

import com.bjfu.jtap.entity.QuestionWithBLOBs;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/18  22:25
 */
public interface QuestionCustomerMapper {

    @Select("select * from question where description = #{desc}")
    public List<QuestionWithBLOBs> selectByDesc(String desc);
}
