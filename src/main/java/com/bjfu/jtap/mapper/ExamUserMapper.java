package com.bjfu.jtap.mapper;

import com.bjfu.jtap.entity.ExamUser;
import com.bjfu.jtap.entity.ExamUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExamUserMapper {
    int countByExample(ExamUserExample example);

    int deleteByExample(ExamUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExamUser record);

    int insertSelective(ExamUser record);

    List<ExamUser> selectByExample(ExamUserExample example);

    ExamUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExamUser record, @Param("example") ExamUserExample example);

    int updateByExample(@Param("record") ExamUser record, @Param("example") ExamUserExample example);

    int updateByPrimaryKeySelective(ExamUser record);

    int updateByPrimaryKey(ExamUser record);
}